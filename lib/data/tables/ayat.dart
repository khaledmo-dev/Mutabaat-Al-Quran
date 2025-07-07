// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';

@DataClassName('Ayah')
class Ayat extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get jozz => integer()();

  IntColumn get page => integer()();

  IntColumn get surah_number => integer()();

  TextColumn get surah_name_en => text()();

  TextColumn get surah_name_ar => text()();

  IntColumn get ayah_number => integer()();

  TextColumn get ayah_text => text()();

  TextColumn get ayah_search_text => text()();
}
