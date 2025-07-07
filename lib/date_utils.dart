import 'package:quran_test/services/localization_service.dart';

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

enum Weekday {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday;

  static List<Weekday> getOrderedWeekdays(Weekday start) {
    List<Weekday> allDays = Weekday.values;
    int startIndex = start.index;
    return [
      ...allDays.sublist(startIndex),
      ...allDays.sublist(0, startIndex),
    ];
  }

  String get label {
    switch (this) {
      case monday:
        return 'day_1'.translate();
      case tuesday:
        return 'day_2'.translate();
      case wednesday:
        return 'day_3'.translate();
      case thursday:
        return 'day_4'.translate();
      case friday:
        return 'day_5'.translate();
      case saturday:
        return 'day_6'.translate();
      case sunday:
        return 'day_7'.translate();
    }
  }

  int get order {
    switch (this) {
      case monday:
        return 1;
      case tuesday:
        return 2;
      case wednesday:
        return 3;
      case thursday:
        return 4;
      case friday:
        return 5;
      case saturday:
        return 6;
      case sunday:
        return 7;
    }
  }
}

String getMonthName(int month, {bool isHijri = false}) {
  if (month < 1 || month > 12) {
    throw ArgumentError('Month must be between 1 and 12');
  }

  return isHijri
      ? "arabic_month_$month".translate()
      : "month_$month".translate();
}

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool normalizedIsAfter(DateTime other) {
    final d1 = DateTime(year, month, day);
    final d2 = DateTime(other.year, other.month, other.day);
    return d1.isAfter(d2);
  }

  DateTime get dateOnly => DateTime(year, month, day);
}
