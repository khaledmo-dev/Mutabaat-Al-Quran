import 'package:quran_test/data/models/entry.dart';

enum SlotStatus { missed, completed, offDay }

class SlotModel {
  final SlotStatus status;
  final DateTime date;
  final List<EntryModel> entries;
  // final int activityId;

  SlotModel({
    required this.status,
    required this.date,
    required this.entries,
    // required this.activityId,
  });
}
