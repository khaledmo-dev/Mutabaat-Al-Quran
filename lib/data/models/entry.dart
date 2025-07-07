import 'package:quran_test/data/database.dart';

class EntryModel {
  final DateTime date;
  final Ayah fromAyah;
  final Ayah toAyah;
  final int activityId;

  EntryModel(
      {required this.date,
      required this.fromAyah,
      required this.toAyah,
      required this.activityId});
}
