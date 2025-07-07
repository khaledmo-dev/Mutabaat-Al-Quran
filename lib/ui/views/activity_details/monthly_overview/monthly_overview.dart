import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:quran_test/data/models/models.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/date_utils.dart';
import 'package:stacked/stacked.dart';

import 'monthly_overview_model.dart';

class MonthlyOverview extends StackedView<MonthlyOverviewModel> {
  const MonthlyOverview(this.sectionId, {super.key});
  final int sectionId;
  @override
  Widget builder(
    BuildContext context,
    MonthlyOverviewModel viewModel,
    Widget? child,
  ) {
    String customeDayName(Weekday day) {
      var local = Localizations.localeOf(context).languageCode;

      if (local == 'en') {
        return day.label.substring(0, 3);
      }
      if (local == 'ar') {
        return day.label.substring(2);
      }

      return day.label;
    }

    const weekDays = Weekday.values;
    // print(viewModel.currentMonth);
    final DayBase date = viewModel.isHijri
        ? DayFromJHijri(JHijri(fDate: viewModel.currentMonth))
        : DayFromDateTime(viewModel.currentMonth);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.withValues(alpha: .2)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!viewModel.consistencyRate.isNaN) ...[
            Text(
              '${"commitment_percentage".translate()} :${viewModel.consistencyRate.toStringAsFixed(1)}%',
            ),
            Divider(color: Colors.blueGrey.withValues(alpha: .2))
          ],
          // Month navigation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              // textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color.fromARGB(16, 0, 0, 0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: viewModel.nextMonth,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getMonthName(date.month, isHijri: viewModel.isHijri)
                          .translate(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date.year.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color.fromARGB(16, 0, 0, 0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: viewModel.prevMonth,
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceSmall,
          Row(
            children: weekDays
                .map(
                  (d) => Expanded(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          customeDayName(d),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Calendar(),
          Divider(
            color: Colors.blueGrey.withValues(alpha: .2),
          ),
          if (viewModel.selectedSlot != null)
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: viewModel.selectedSlot!.entries.map(
                (e) {
                  String text = "";
                  if (e.fromAyah.surah_number == e.toAyah.surah_number) {
                    text =
                        "${e.fromAyah.ayah_number} - ${e.toAyah.ayah_number} ${e.fromAyah.surah_name_ar} ";
                  } else {
                    text =
                        "${e.fromAyah.ayah_number} ${e.fromAyah.surah_name_ar} - ${e.toAyah.ayah_number} ${e.toAyah.surah_name_ar}";
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(
                        top: BorderSide(width: 1, color: kcPrimaryColor),
                        right: BorderSide(width: 1, color: kcPrimaryColor),
                        bottom: BorderSide(width: 2, color: kcPrimaryColor),
                        left: BorderSide(width: 1, color: kcPrimaryColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
        ],
      ),
    );
  }

  @override
  MonthlyOverviewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MonthlyOverviewModel(sectionId);
}

class Calendar extends ViewModelWidget<MonthlyOverviewModel> {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MonthlyOverviewModel viewModel) {
    final slots = viewModel.data ?? [];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: .95,
        mainAxisSpacing: 10,
      ),
      itemCount: slots.isEmpty ? 7 * 5 : slots.length,
      itemBuilder: (context, index) {
        if (slots.isEmpty) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
              // border: isMissed ? Border.all(color: Colors.blue) : null,
            ),
            alignment: Alignment.center,
          );
        }

        final slot = slots[index];
        final DayBase day = viewModel.isHijri
            ? DayFromJHijri(JHijri(fDate: slot.date))
            : DayFromDateTime(slot.date);

        final DayBase now = viewModel.isHijri
            ? DayFromJHijri(JHijri(fDate: DateTime.now()))
            : DayFromDateTime(DateTime.now());

        // print(slot.date);

        final isToday = now.year == day.year &&
            now.month == day.month &&
            now.day == day.day;

        bool isCurrentMonth = day.month == viewModel.currentMonth.month;

        if (viewModel.isHijri) {
          isCurrentMonth =
              day.month == JHijri(fDate: viewModel.currentMonth).month;
        }

        // final isSelected = _selectedDay != null &&
        //     _selectedDay!.year == day.year &&
        //     _selectedDay!.month == day.month &&
        //     _selectedDay!.day == day.day;

        // final textColor = isCurrentMonth ? Colors.black : Colors.grey[400];

        Color? getTextColor() {
          if (slot == viewModel.selectedSlot) {
            return Colors.white;
          }

          if (!isCurrentMonth) {
            return Colors.grey[400];
          }

          return null;
        }

        Color? dayBackgroundColor() {
          if (slot.status == SlotStatus.completed) {
            return Colors.green.withValues(alpha: isCurrentMonth ? 1 : .3);
          }

          if (slot.status == SlotStatus.missed) {
            return Colors.red.withValues(alpha: isCurrentMonth ? 1 : .3);
          }

          if (slot.entries.isNotEmpty) {
            return Colors.amber.withValues(
              alpha: viewModel.selectedSlot == slot ? 1 : .3,
            );
          }

          if (slot == viewModel.selectedSlot) {
            return kcPrimaryColor;
          }

          if (isToday) {
            return Colors.black12;
          }

          return Colors.transparent;
        }

        return GestureDetector(
          onTap: () {
            viewModel.selectSlot(slot);
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              if (isToday)
                Positioned(
                  bottom: -5,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kcPrimaryColor,
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: dayBackgroundColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: getTextColor(),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

abstract class DayBase {
  int get year;
  int get month;
  int get day;

  @override
  String toString() =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

class DayFromDateTime implements DayBase {
  final DateTime date;
  DayFromDateTime(this.date);

  @override
  int get year => date.year;
  @override
  int get month => date.month;
  @override
  int get day => date.day;

  @override
  String toString() => 'Gregorian: ${super.toString()}';
}

class DayFromJHijri implements DayBase {
  final JHijri hijri;
  DayFromJHijri(this.hijri);

  @override
  int get year => hijri.hijri.year;
  @override
  int get month => hijri.hijri.month;
  @override
  int get day => hijri.hijri.day;

  @override
  String toString() => 'Hijri: ${super.toString()}';
}
