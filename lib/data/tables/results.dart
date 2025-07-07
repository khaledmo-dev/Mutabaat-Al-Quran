import 'package:drift/drift.dart';
import 'tables.dart';

class Results extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();

  IntColumn get templateId => integer()
      .nullable()
      .references(Templates, #id, onDelete: KeyAction.setNull)();
}

class Answers extends Table {
  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isCorrect => boolean()();

  IntColumn get fromAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get toAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get resultId =>
      integer().references(Results, #id, onDelete: KeyAction.cascade)();
}
