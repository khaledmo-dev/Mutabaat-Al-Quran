import 'package:drift/drift.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/data/models/answer.dart';
import 'package:quran_test/data/models/result.dart';

class ResultService {
  final _database = locator<Database>();

  deleteResult(int id) {
    (_database.delete(_database.results)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<ResultModel>> watchResults() {
    return _database.customSelect(
      '''
SELECT
  r.*,
  t.name AS test_name,
  SUM(CASE WHEN a.is_correct = 1 THEN 1 ELSE 0 END) AS correct_count,
  SUM(CASE WHEN a.is_correct = 0 THEN 1 ELSE 0 END) AS incorrect_count
FROM
  results r
LEFT JOIN
  answers a ON a.result_id = r.id
LEFT JOIN
  templates t ON r.template_id = t.id
GROUP BY
  r.id
ORDER BY
  r.id DESC;
''',
      readsFrom: {_database.results},
    ).map(
      (row) {
        return ResultModel(
          id: row.read('id'),
          name: row.readNullable('test_name'),
          totalCorrect: row.read('correct_count'),
          totalMistake: row.read('incorrect_count'),
          date: row.read('date'),
        );
      },
    ).watch();
  }

  Future<List<AnswerModel>> getResultAnswers(int id) {
    final ayatTable = _database.ayat;
    late final answersTable = _database.answers;

    final fromAlias = _database.alias(ayatTable, 'from_ayah');
    final toAlias = _database.alias(ayatTable, 'to_ayah');

    return ((_database.select(answersTable)
          ..where((t) => t.resultId.equals(id)))
        .join(
      [
        innerJoin(fromAlias, fromAlias.id.equalsExp(answersTable.fromAyah)),
        innerJoin(toAlias, toAlias.id.equalsExp(answersTable.toAyah)),
      ],
    )).map((row) {
      return AnswerModel(
        isCorrect: row.readTable(answersTable).isCorrect,
        fromAyah: row.readTable(fromAlias),
        toAyah: row.readTable(toAlias),
      );
    }).get();
  }
}
