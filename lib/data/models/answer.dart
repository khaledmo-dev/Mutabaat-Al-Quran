import 'package:quran_test/data/database.dart';

class AnswerModel {
  final bool isCorrect;
  final Ayah fromAyah;
  final Ayah toAyah;

  AnswerModel({
    required this.isCorrect,
    required this.fromAyah,
    required this.toAyah,
  });
}
