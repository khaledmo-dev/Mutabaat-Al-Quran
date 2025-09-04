import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_test/data/tables/entries.dart';
import 'package:quran_test/ui/common/date_utils.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart' as p;
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

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
  Iterable<TableInfo<Table, dynamic>> get allTables => [
        activities,
        activitySchedules,
        entries,
        results,
        answers,
        templates,
        templateSegments
      ];

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

  Future<bool> importData({bool keepOld = true}) async {
    final result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['xlsx', 'xls'], type: FileType.custom);

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      final bytes = File(filePath).readAsBytesSync();

      // Decode Excel
      final excel = Excel.decodeBytes(bytes);
      try {
        await transaction(
          () async {
            if (!keepOld) {
              await Future.forEach(allTables, (table) async {
                await delete(table).go();
              });
            }

            var activitiesSheet = excel[activities.actualTableName];
            var templatesSheet = excel[templates.actualTableName];
            var resultsSheet = excel[results.actualTableName];

            final Map<int, int> activitiesIdMapping = {};

            final Map<int, int> templatesIdMapping = {};

            final Map<int, int> resultsIdMapping = {};

            await Future.forEach(activitiesSheet.rows, (row) async {
              var value = await into(activities).insertReturning(
                ActivitiesCompanion.insert(
                  // id:
                  name: row[1]!.value.toString().replaceAll('"', ""),
                  order: int.parse(row[2]!.value.toString()),
                ),
              );

              activitiesIdMapping[(int.parse(row[0]!.value.toString()))] =
                  value.id;
            });

            await Future.forEach(templatesSheet.rows, (row) async {
              var value = await into(templates).insertReturning(
                TemplatesCompanion.insert(
                  name: row[1]!.value.toString().replaceAll('"', ""),
                ),
              );

              templatesIdMapping[(int.parse(row[0]!.value.toString()))] =
                  value.id;
            });

            await Future.forEach(resultsSheet.rows, (row) async {
              var value = await into(results)
                  .insertReturning(ResultsCompanion.insert());

              resultsIdMapping[(int.parse(row[0]!.value.toString()))] =
                  value.id;
            });

            var schedulesSheet = excel[activitySchedules.actualTableName];

            var entriesSheet = excel[entries.actualTableName];

            var templatesSegmentsSheet =
                excel[templateSegments.actualTableName];

            var answersSheet = excel[answers.actualTableName];

            await batch(
              (batch) async {
                batch.insertAllOnConflictUpdate(
                  activitySchedules,
                  schedulesSheet.rows.map(
                    (row) {
                      return ActivitySchedulesCompanion.insert(
                        scheduledDays:
                            (jsonDecode(row[2]!.value.toString()) as List)
                                .map((item) => int.parse(item.toString()))
                                .toList(),
                        activityId: activitiesIdMapping[
                            int.parse(row[1]!.value.toString())]!,
                        startDate: Value(DateTime.fromMillisecondsSinceEpoch(
                            int.parse(row[3]!.value.toString()),
                            isUtc: true)),
                        endDate: row[4]!.value.toString() == "null"
                            ? const Value.absent()
                            : Value(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(row[4]!.value.toString()),
                                    isUtc: true),
                              ),
                      );
                    },
                  ),
                );

                batch.insertAll(
                  entries,
                  entriesSheet.rows.map(
                    (row) {
                      return EntriesCompanion.insert(
                        body: "",
                        date: (DateTime.fromMillisecondsSinceEpoch(
                            int.parse(row[2]!.value.toString()),
                            isUtc: true)),
                        fromAyah: int.parse(row[3]!.value.toString()),
                        toAyah: int.parse(row[4]!.value.toString()),
                        activityId: activitiesIdMapping[
                            int.parse(row[5]!.value.toString())]!,
                      );
                    },
                  ),
                );

                batch.insertAll(
                  templateSegments,
                  templatesSegmentsSheet.rows.map(
                    (row) {
                      return TemplateSegmentsCompanion.insert(
                        fromAyah: int.parse(row[1]!.value.toString()),
                        toAyah: int.parse(row[2]!.value.toString()),
                        templateId: templatesIdMapping[
                            int.parse(row[3]!.value.toString())]!,
                      );
                    },
                  ),
                );

                batch.insertAll(
                  answers,
                  answersSheet.rows.map(
                    (row) {
                      return AnswersCompanion.insert(
                        isCorrect: json.decode(row[1]!.value.toString()),
                        fromAyah: json.decode(row[2]!.value.toString()),
                        toAyah: json.decode(row[3]!.value.toString()),
                        resultId: resultsIdMapping[
                            int.parse(row[4]!.value.toString())]!,
                      );
                    },
                  ),
                );
              },
            );
          },
        );
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }

  Future<bool> exportData() async {
    var excel = Excel.createExcel();

    // ignore: avoid_function_literals_in_foreach_calls
    allTables.forEach(
      (e) async {
        List<dynamic> rows = await select(e).get();
        var sheet = excel[e.actualTableName];

        rows.forEach(
          (row) {
            if (row is DataClass) {
              sheet.appendRow(
                (row)
                    .toJson()
                    .entries
                    .map((e) => TextCellValue(jsonEncode(e.value)))
                    .toList(),
              );
            }
          },
        );
      },
    );

    final dir = await getApplicationDocumentsDirectory();
    var savePath = '${dir.path}/backup.xlsx';

    // Save Excel file
    final bytes = excel.encode();
    if (bytes == null) throw Exception('Failed to encode excel file');
    final file = File(savePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes, flush: true);

    var result = await FilePicker.platform.saveFile(
      dialogTitle: 'Save your backup',
      fileName: 'backup_${DateTime.now().formatDate}.xlsx',
      bytes: await file.readAsBytes(),
    );

    return result != null;
  }
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
