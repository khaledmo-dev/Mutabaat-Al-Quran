import 'package:drift/drift.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/data/models/template.dart';
import 'package:rxdart/rxdart.dart';

class TemplateService {
  final _database = locator<Database>();

  late final ayatTable = _database.ayat;
  late final templatesTable = _database.templates;
  late final segmentsTable = _database.templateSegments;

  deleteTemplate(int id) {
    (_database.delete(templatesTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> insertTemplate(String name, List<Map> records) async {
    var value = await _database
        .into(templatesTable)
        .insertReturning(TemplatesCompanion.insert(name: name));

    for (var scope in records) {
      int firstAyahID = (await (_database.select(ayatTable)
                ..where(
                  (ayah) =>
                      ayah.surah_number.equals(scope['first_surah']) &
                      ayah.ayah_number.equals(scope['first_ayah']),
                ))
              .getSingle())
          .id;

      int lastAyah = (await (_database.select(ayatTable)
                ..where(
                  (ayah) =>
                      ayah.surah_number.equals(scope['last_surah']) &
                      ayah.ayah_number.equals(scope['last_ayah']),
                ))
              .getSingle())
          .id;

      _database.into(segmentsTable).insert(
            TemplateSegmentsCompanion.insert(
              fromAyah: firstAyahID,
              toAyah: lastAyah,
              templateId: value.id,
            ),
          );
    }
  }

  Stream<List<TemplateModel>> watchTemplates() {
    Stream<List<Template>> testStream =
        _database.select(templatesTable).watch();

    final fromAlias = _database.alias(ayatTable, 'from_ayah');
    final toAlias = _database.alias(ayatTable, 'to_ayah');

    Stream<List<(int, Segment)>> scopesStream =
        (_database.select(segmentsTable)).join([
      innerJoin(fromAlias, fromAlias.id.equalsExp(segmentsTable.fromAyah)),
      innerJoin(toAlias, toAlias.id.equalsExp(segmentsTable.toAyah)),
    ]).map((row) {
      return (
        row.readTable(segmentsTable).templateId,
        (
          from: row.readTable(fromAlias),
          to: row.readTable(toAlias),
        ),
      );
    }).watch();

    return Rx.combineLatest2(
      testStream,
      scopesStream,
      (tests, s) {
        List<TemplateModel> result = [];

        for (var test in tests) {
          var segments = s
              .where((v) => v.$1 == test.id)
              .map((segment) => (from: segment.$2.from, to: segment.$2.to))
              .toList();

          result.add(
            TemplateModel(id: test.id, name: test.name, segments: segments),
          );
        }

        return result;
      },
    );
  }
}
