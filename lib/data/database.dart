import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_test/data/tables/entries.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart' as p;

import 'tables/tables.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  Ayat,
  Templates,
  TemplateSegments,
  Results,
  Answers,
  Activities,
  ActivitySchedules,
  Entries,
])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {

          // await customStatement('PRAGMA foreign_keys = OFF');

          // final m = Migrator(this);
          // for (final table in allTables) {
          //   if (table.actualTableName == 'ayat') {
          //     continue;
          //   }
          //   await m.deleteTable(table.actualTableName);
          //   await m.createTable(table);
          // }

          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (m) async {
          await m.createAll();
          await batch((batch) async {
            var list = await _populateAyat();
            batch.insertAllOnConflictUpdate(ayat, list);
          });
        },
      );
}

Future<List<Ayah>> _populateAyat() async {
  final String response = await rootBundle.loadString('assets/quran.json');

  // Decode the JSON
  List data = json.decode(response);
  List<Ayah> ayatList = [];
  for (var ayahJson in data) {
    var ayah = Ayah(
      id: ayahJson["id"],
      jozz: ayahJson["jozz"],
      page: ayahJson["page"],
      surah_number: ayahJson["sura_no"],
      surah_name_en: ayahJson["sura_name_en"],
      surah_name_ar: ayahJson["sura_name_ar"],
      ayah_number: ayahJson["aya_no"],
      ayah_text: ayahJson["aya_text"],
      ayah_search_text: ayahJson["aya_text_emlaey"],
    );
    ayatList.add(ayah);
  }

  return ayatList;
}
