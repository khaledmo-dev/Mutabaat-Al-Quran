import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/table/table_viewmodel.dart';
import 'package:quran_test/date_utils.dart';
import 'package:stacked/stacked.dart';

class DatesColumn extends ViewModelWidget<TableViewModel> {
  const DatesColumn({super.key});

  @override
  Widget build(BuildContext context, TableViewModel viewModel) {
    return ValueListenableBuilder(
      valueListenable: languageNotifier,
      builder: (context, value, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  width: screenWidth(context) * .3,
                  height: constraints.maxHeight / 8,
                ),
                ...Weekday.getOrderedWeekdays(Weekday.sunday).mapIndexed(
                  (index, day) {
                    var date = viewModel.weekDates
                        .firstWhere((d) => d.weekday == day.order);

                    bool isToday = viewModel.date.isSameDate(date);

                    return Stack(
                      children: [
                        Container(
                          width: screenWidth(context) * .3,
                          height: constraints.maxHeight / 8,
                          decoration: BoxDecoration(
                            color: isToday ? kcPrimaryColor : null,
                            border: BorderDirectional(
                              bottom: BorderSide(
                                color: const Color(0xffE3E3E3),
                                width: index == 6 ? 0 : 1,
                              ),
                              end: const BorderSide(
                                color: Color(0xffE3E3E3),
                              ),
                              top: BorderSide(
                                color: const Color(0xffE3E3E3),
                                width: index == 0 ? 1 : 0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                day.label.translate(),
                                style: TextStyle(
                                  color: isToday ? Colors.white : null,
                                  fontWeight: isToday ? FontWeight.bold : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          top: 6,
                          start: 6,
                          child: Text(
                            formatDateMMDD(date, viewModel.isHijri),
                            style: TextStyle(
                              fontSize: 12,
                              color: isToday ? Colors.white : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ).toList()
              ],
            );
          },
        );
      },
    );
  }
}
