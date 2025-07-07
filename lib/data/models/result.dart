class ResultModel {
  final int id;
  final String? name;

  final DateTime date;

  final int totalCorrect;
  final int totalMistake;

  ResultModel({
    required this.id,
    required this.name,
    required this.date,
    required this.totalCorrect,
    required this.totalMistake,
  });
}
