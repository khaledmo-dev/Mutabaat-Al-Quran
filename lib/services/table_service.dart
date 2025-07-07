import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/date_utils.dart';
import 'package:rxdart/rxdart.dart';

import '../data/models/models.dart';

class TableService {
  final _database = locator<Database>();

  late final ayatTable = _database.ayat;
  late final entriesTable = _database.entries;
  late final activitiesTable = _database.activities;
  late final activitySchedulesTable = _database.activitySchedules;

  Future reorderActivities(List<ActivityModel> activities) async {
    for (int i = 0; i < activities.length; i++) {
      final item = activities[i];
      await (_database.update(activitiesTable)
            ..where((t) => t.id.equals(item.id)))
          .write(
        ActivitiesCompanion.insert(
          name: item.name,
          order: i,
        ),
      );
    }
  }

  Future insertEntries({
    required List<Map> entries,
    required DateTime date,
    required int activityId,
  }) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day + 1);

    await (_database.delete(entriesTable)
          ..where((t) =>
              t.activityId.equals(activityId) &
              t.date.isBiggerOrEqualValue(startOfDay) &
              t.date.isSmallerThanValue(endOfDay)))
        .go();

    for (var entry in entries) {
      var value = entry;
      int firstAyahID = (await (_database.select(ayatTable)
                ..where(
                  (ayah) =>
                      ayah.surah_number.equals(value['first_surah']) &
                      ayah.ayah_number.equals(value['first_ayah']),
                ))
              .getSingle())
          .id;

      int lastAyah = (await (_database.select(ayatTable)
                ..where(
                  (ayah) =>
                      ayah.surah_number.equals(value['last_surah']) &
                      ayah.ayah_number.equals(value['last_ayah']),
                ))
              .getSingle())
          .id;

      _database.into(entriesTable).insert(
            EntriesCompanion.insert(
              body: '',
              date: date,
              fromAyah: firstAyahID,
              toAyah: lastAyah,
              activityId: activityId,
            ),
          );
    }
  }

  Stream<List<ActivityModel>> watchActivities({required List<DateTime> range}) {
    final start = range.first.dateOnly;
    final end = range.last.add(const Duration(days: 1)).dateOnly;

    final fromAlias = _database.alias(ayatTable, 'from_ayah');
    final toAlias = _database.alias(ayatTable, 'to_ayah');

    Stream<List<Activity>> activityStream = (_database.select(activitiesTable)
          ..orderBy([(t) => OrderingTerm.asc(t.order)]))
        .watch();

    Stream<List<EntryModel>> entriesStream = (_database.select(entriesTable)
          ..where((tbl) => tbl.date.isBetweenValues(start, end)))
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

    // Load all schedule periods that could apply to this month
    final schedulesStream = (_database.select(activitySchedulesTable)
          ..orderBy([(t) => OrderingTerm.asc(t.startDate)])
          ..where((tbl) =>
              tbl.startDate.isSmallerOrEqualValue(end) &
              (tbl.endDate.isNull() | tbl.endDate.isBiggerThanValue(start))))
        .watch();

    return Rx.combineLatest3(activityStream, entriesStream, schedulesStream,
        (activities, entries, schedules) {
      final List<ActivityModel> result = [];

      for (var activity in activities) {
        var slots = _getSlots(
          entries.where((e) => e.activityId == activity.id).toList(),
          range,
          schedules.where((s) => s.activityId == activity.id).toList(),
        );
        result.add(
          ActivityModel(
            id: activity.id,
            name: activity.name,
            slots: slots,
          ),
        );
      }
      return result;
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

    return slots;
  }
}
