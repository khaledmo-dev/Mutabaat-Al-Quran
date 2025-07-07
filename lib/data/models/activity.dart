import 'package:quran_test/data/models/slot.dart';

class ActivityModel {
  final int id;
  final String name;
  final List<int> scheduleDays;
  final List<SlotModel> slots;

  ActivityModel({
    required this.id,
    required this.name,
    required this.slots,
    this.scheduleDays = const [],
  });
}
