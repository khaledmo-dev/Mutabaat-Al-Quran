import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/data/models/models.dart';
import 'package:quran_test/date_utils.dart';
import 'package:rxdart/rxdart.dart';

class ActivityService {
  final _database = locator<Database>();

  late final activitiesTable = _database.activities;
  late final activitySchedulesTable = _database.activitySchedules;

  deleteActivity(int id) {
    (_database.delete(activitiesTable)..where((t) => t.id.equals(id))).go();
  }

  Stream<ActivityModel> watchActivity(int id) {
    var activity = (_database.select(activitiesTable)
          ..where((t) => t.id.equals(id)))
        .asyncMap((a) async {
      var schedule = await (_database.select(activitySchedulesTable)
            ..where((t) => t.activityId.equals(id) & t.endDate.isNull()))
          .getSingleOrNull();

      return ActivityModel(
        id: a.id,
        name: a.name,
        slots: [],
        scheduleDays: schedule?.scheduledDays ?? [],
      );
    }).watchSingle();

    return activity;
  }

  void upsertActivity(
      {required ActivitiesCompanion activity,
      required List<int> scheduleDays}) {
    _database.transaction(
      () async {
        final maxOrder = await (activitiesTable.selectOnly()
              ..addColumns([activitiesTable.order.max()]))
            .map((row) => row.read(activitiesTable.order.max()))
            .getSingle();

        final newOrder = (maxOrder ?? -1) + 1;

        activity = activity.copyWith(order: Value(newOrder));

        var activityModel = await _database
            .into(activitiesTable)
            .insertReturning(activity, onConflict: DoUpdate((o) => activity));

        var schedule = await (_database.select(activitySchedulesTable)
              ..where((t) =>
                  t.activityId.equals(activityModel.id) & t.endDate.isNull()))
            .getSingleOrNull();

        var date = DateTime.now();

        if (schedule != null) {
          await (_database.update(activitySchedulesTable)
                ..where((t) => t.id.equals(schedule.id)))
              .write(
            ActivitySchedulesCompanion(endDate: Value(date)),
          );
        }

        await _database.into(activitySchedulesTable).insert(
              ActivitySchedulesCompanion.insert(
                activityId: activityModel.id,
                scheduledDays: scheduleDays,
              ),
            );
      },
    );
  }

  Stream<List<SlotModel>> watchActivitySlots(
      {required int id, required List<DateTime> range}) {
    late final ayatTable = _database.ayat;
    late final entriesTable = _database.entries;
    late final activitySchedulesTable = _database.activitySchedules;

    final start = range.first.dateOnly;
    final end = range.last.add(const Duration(days: 1)).dateOnly;

    final fromAlias = _database.alias(ayatTable, 'from_ayah');
    final toAlias = _database.alias(ayatTable, 'to_ayah');

    Stream<List<EntryModel>> entriesStream = (_database.select(entriesTable)
          ..where((tbl) =>
              tbl.date.isBetweenValues(start, end) & tbl.activityId.equals(id)))
        .join([
      innerJoin(fromAlias, fromAlias.id.equalsExp(entriesTable.fromAyah)),
      innerJoin(toAlias, toAlias.id.equalsExp(entriesTable.toAyah)),
    ]).map((row) {
      var entry = row.readTable(entriesTable);
      return EntryModel(
        date: entry.date,
        fromAyah: row.readTable(fromAlias),
        toAyah: row.readTable(toAlias),
        activityId: entry.activityId,
      );
    }).watch();

    final schedulesStream = (_database.select(activitySchedulesTable)
          ..orderBy([(t) => OrderingTerm.asc(t.startDate)])
          ..where((tbl) =>
              tbl.activityId.equals(id) &
              tbl.startDate.isSmallerOrEqualValue(end) &
              (tbl.endDate.isNull() | tbl.endDate.isBiggerThanValue(start))))
        .watch();

    return Rx.combineLatest2(entriesStream, schedulesStream,
        (entries, schedules) {
      var slots = _getSlots(entries, range, schedules);

      return slots;
    });
  }

  List<SlotModel> _getSlots(
    List<EntryModel> entries,
    List<DateTime> range,
    List<ActivitySchedule> schedules,
  ) {
    List<SlotModel> slots = [];
    final start = range.first;
    final end = range.last.add(const Duration(days: 1));

    final totalDays = end.difference(start).inDays;

    for (int i = 0; i < totalDays; i++) {
      final day = DateTime(start.year, start.month, start.day + i);
      var dayEntries = entries.where((e) => e.date.isSameDate(day)).toList();
      // print(dayEntries);
      final weekday = day.weekday;

      if (day.isAfter(DateTime.now())) {
        slots.add(
          SlotModel(
            status: SlotStatus.offDay,
            date: day,
            entries: dayEntries,
          ),
        );
        continue;
      }

      schedules.sort((a, b) => b.startDate.compareTo(a.startDate));

      // Find the schedule that was active on this day
      final schedule = schedules.firstWhereOrNull(
        (s) =>
            !s.startDate.normalizedIsAfter(day) &&
            (s.endDate == null || s.endDate!.normalizedIsAfter(day)),
      );

      if (schedule == null) {
        slots.add(SlotModel(
          status: SlotStatus.offDay,
          date: day,
          entries: dayEntries,
        ));
        continue;
      }

      final scheduledDays = schedule.scheduledDays;

      if (!scheduledDays.contains(weekday)) {
        slots.add(SlotModel(
          status: SlotStatus.offDay,
          date: day,
          entries: dayEntries,
        ));
      } else if (dayEntries.isNotEmpty) {
        slots.add(SlotModel(
          status: SlotStatus.completed,
          date: day,
          entries: dayEntries,
        ));
      } else {
        slots.add(SlotModel(
          status: SlotStatus.missed,
          date: day,
          entries: dayEntries,
        ));
      }
    }
    // slots.forEach((slot){
    //   print(slot.date);
    // });

    return slots;
  }
}
