import 'dart:convert';

import 'package:drift/drift.dart';

@DataClassName('Activity')
class Activities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get order => integer()();
}

class ActivitySchedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get activityId =>
      integer().references(Activities, #id, onDelete: KeyAction.cascade)();

  TextColumn get scheduledDays => text().map(const WeekdayListConverter())();

  DateTimeColumn get startDate => dateTime().withDefault(
        Constant(
          DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
        ),
      )();

  DateTimeColumn get endDate => dateTime().nullable()();
}

class WeekdayListConverter extends TypeConverter<List<int>, String> {
  const WeekdayListConverter();

  @override
  List<int> fromSql(String fromDb) {
    return List<int>.from(jsonDecode(fromDb));
  }

  @override
  String toSql(List<int> value) {
    return jsonEncode(value);
  }
}
