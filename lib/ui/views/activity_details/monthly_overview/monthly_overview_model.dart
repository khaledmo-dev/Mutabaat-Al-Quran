import 'package:jhijri/_src/_jHijri.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/models/models.dart';
import 'package:quran_test/date_utils.dart';
import 'package:quran_test/services/activity_service.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';

class MonthlyOverviewModel extends StreamViewModel<List<SlotModel>> {
  final int activityId;
  MonthlyOverviewModel(this.activityId);

  final _activityService = locator<ActivityService>();

  bool get isHijri => locator<LocalStorageService>().isHijri;

  SlotModel? _selectedSlot;

  SlotModel? get selectedSlot => _selectedSlot;

  DateTime _currentMonth = DateTime.now();

  DateTime get currentMonth => _currentMonth;

  double get consistencyRate {
    if (data == null) {
      return double.nan;
    }
    int missedDay = 0;
    int completedDays = 0;

    for (var slot in data!) {
      if (slot.status == SlotStatus.missed) {
        missedDay++;
      } else if (slot.status == SlotStatus.completed) {
        completedDays++;
      }
    }

    return (completedDays / (missedDay + completedDays)) * 100;
  }

  List<DateTime> get days {
    DateTime first;
    DateTime last;
    if (isHijri) {
      var hijriDate = JHijri(fDate: _currentMonth).hijri;
      var firstHijri =
          JHijri(fYear: hijriDate.year, fMonth: hijriDate.month, fDay: 1);
      var secondHijri =
          JHijri(fYear: hijriDate.year, fMonth: hijriDate.month + 1, fDay: 0);

      first = firstHijri.dateTime;
      last = secondHijri.dateTime;
    } else {
      first = DateTime(_currentMonth.year, _currentMonth.month, 1);
      last = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    }

    // Prepend days from previous month
    final prependCount = first.weekday % Weekday.sunday.order;
    final days = <DateTime>[];
    for (int i = 0; i < prependCount; i++) {
      days.add(first.subtract(Duration(days: prependCount - i)));
    }

    // Days in current month
    for (int d = 1; d <= last.difference(first).inDays + 1; d++) {
      days.add(first.add(Duration(days: d - 1)));
    }

    // Append days from next month
    final appendCount = DateTime.saturday - last.weekday;
    for (int i = 0; i < appendCount; i++) {
      days.add(last.add(Duration(days: i + 1)));
    }

    return days;
  }

  void prevMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    _selectedSlot = null;
    notifySourceChanged(clearOldData: true);
  }

  void nextMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    _selectedSlot = null;
    notifySourceChanged(clearOldData: true);
    initialise();
  }

  void selectSlot(SlotModel slot) {
    _selectedSlot = slot;
    rebuildUi();
  }

  @override
  Stream<List<SlotModel>> get stream =>
      _activityService.watchActivitySlots(id: activityId, range: days);
}
