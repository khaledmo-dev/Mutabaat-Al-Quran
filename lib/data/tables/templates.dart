import 'package:drift/drift.dart';
import 'package:quran_test/data/tables/ayat.dart';

class Templates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class TemplateSegments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get fromAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get toAyah =>
      integer().references(Ayat, #id, onDelete: KeyAction.cascade)();

  IntColumn get templateId =>
      integer().references(Templates, #id, onDelete: KeyAction.cascade)();
}
