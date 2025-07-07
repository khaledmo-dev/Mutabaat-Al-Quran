import 'package:drift/drift.dart';
import 'package:quran_test/data/tables/tables.dart';

@DataClassName('Entry')
class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get body => text()();

  DateTimeColumn get date => dateTime()();

  IntColumn get fromAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get toAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get activityId =>
      integer().references(Activities, #id, onDelete: KeyAction.cascade)();
}
