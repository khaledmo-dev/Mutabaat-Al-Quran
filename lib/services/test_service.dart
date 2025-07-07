import 'package:drift/drift.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/surahs.dart';

class TestService {
  final _database = locator<Database>();

  Future<int> recordTestResult(
      {int? templateId, required List<AnswersCompanion> resultAnwers}) async {
    return _database.transaction(() async {
      var test = await _database.into(_database.results).insertReturning(
          ResultsCompanion.insert(templateId: Value(templateId)));

      await _database.batch((batch) async {
        batch.insertAll(
          _database.answers,
          resultAnwers.map(
            (e) => e.copyWith(resultId: Value(test.id)),
          ),
        );
      });

      return test.id;
    });
  }

  Future<List<int>> getCustomExamRange(List<Map> records) async {
    final ayatTable = _database.ayat;

    final Set<int> range = {};

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

      for (int i = firstAyahID; i <= lastAyah; i++) {
        range.add(i);
      }
    }

    return range.toList();
  }

  Future<List<Ayah>> getQuestion(List<int> range) async {
    var firstAyah = await _database.customSelect(
      '''
          SELECT *, a.id as id
          FROM ayat as a
          WHERE id IN (${range.join(',')})
          ORDER BY RANDOM()
          LIMIT 1;
      ''',
    ).map((e) {
      return Ayah.fromJson(e.data);
    }).getSingle();

    int firstAyahID;
    if (firstAyah.ayah_number > surahMap[firstAyah.surah_number]!["aya"] - 4) {
      firstAyahID = firstAyah.id - 4;
    } else {
      firstAyahID = firstAyah.id;
    }

    return (_database.select(_database.ayat)
          ..where((a) => a.id.isBiggerOrEqualValue(firstAyahID))
          ..orderBy([(u) => OrderingTerm.asc(u.id)])
          ..limit(5))
        .get();
  }
}
