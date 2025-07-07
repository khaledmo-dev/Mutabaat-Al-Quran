import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/activity.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/table_service.dart';
import 'package:quran_test/date_utils.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class TableViewModel extends StreamViewModel<List<ActivityModel>> {
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_localStorage, ...super.listenableServices];

  final _tableService = locator<TableService>();
  final _navigationService = locator<NavigationService>();
  final _localStorage = locator<LocalStorageService>();

  goToActivityDetails(int id) {
    _navigationService.navigateToActivityDetailsView(id: id);
  }

  changeCalendar() {
    _localStorage.isHijri = !_localStorage.isHijri;
    rebuildUi();
  }

  bool get isHijri => _localStorage.isHijri;

  reorderAcitivity(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }

    var list = List<ActivityModel>.from(data!);

    final movedItem = list.removeAt(oldIndex);
    list.insert(newIndex, movedItem);

    _tableService.reorderActivities(list);
  }

  Future<DateTime?> openDialog(BuildContext context) async {
    return await showGlobalDatePicker(
      context: context,
      pickerType: PickerType.JHijri,
      selectedDate: JDateModel(dateTime: date),
      primaryColor: kcPrimaryColor,
    ).then((e) {
      return e?.date;
    });
  }

  pickDate(context) async {
    if (isHijri) {
      final value = await openDialog(context);
      if (value != null) {
        date = value;
        notifySourceChanged(clearOldData: true);
      }
      return;
    }

    var value = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(const Duration(days: 1000)),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
    );
    if (value != null) {
      date = value;
      notifySourceChanged(clearOldData: true);
    }
  }

  void nextWeek() {
    date = date.subtract(const Duration(days: 7));
    notifySourceChanged(clearOldData: true);
  }

  void prevWeek() {
    date = date.add(const Duration(days: 7));
    notifySourceChanged(clearOldData: true);
  }

  DateTime date = DateTime.now();

  int get weekNumber => getWeekNumber(date, isHijri);

  // Get all dates in this week (Monday to Sunday)
  List<DateTime> get weekDates => getWeekDates(date);

  List<ActivityModel> get activities => data ?? [];

  @override
  Stream<List<ActivityModel>> get stream =>
      _tableService.watchActivities(range: weekDates);
}

int getWeekNumber(DateTime date, bool isHijri) {
  if (isHijri) {
    var hijriDate = JHijri(fDate: date).hijri;
    final jHijri = JHijri(fMonth: 1, fYear: hijriDate.year, fDay: 1);

    DateTime thursday =
        hijriDate.dateTime.add(Duration(days: 4 - date.weekday));
    DateTime firstDayOfYear = jHijri.dateTime;

    int daysDifference = thursday.difference(firstDayOfYear).inDays;

    return ((daysDifference + firstDayOfYear.weekday - 1) / 7).floor() + 1;
  }
  // Adjust to nearest Thursday
  DateTime thursday = date.add(Duration(days: 4 - date.weekday));
  DateTime firstDayOfYear = DateTime(thursday.year, 1, 1);
  int daysDifference = thursday.difference(firstDayOfYear).inDays;

  return ((daysDifference + firstDayOfYear.weekday - 1) / 7).floor() + 1;
}

List<DateTime> getWeekDates(DateTime date) {
  int offset = (date.weekday) % Weekday.sunday.order;
  DateTime startOfWeek = date.subtract(Duration(days: offset));
  return List.generate(7, (i) => startOfWeek.add(Duration(days: i)).dateOnly);
}

String formatDateMMDD(DateTime date, isHijri) {
  if (isHijri) {
    var hijri = JHijri(fDate: date);
    final month = hijri.month.toString().padLeft(2, '0');
    final day = hijri.day.toString().padLeft(2, '0');
    return '$month-$day';
  }

  return DateFormat('MM-dd').format(date);
}
