import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/activity.dart';
import 'package:quran_test/data/models/slot.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/table/widgets/entry_form.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivityColumn extends StatelessWidget {
  const ActivityColumn(this.activity, {super.key, required this.index});
  final ActivityModel activity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
        var slots = activity.slots;
        return Column(
          children: [
            ReorderableDelayedDragStartListener(
              index: index,
              child: InkWell(
                onTap: () {
                  locator<NavigationService>()
                      .navigateToActivityDetailsView(id: activity.id);
                },
                child: Ink(
                  width: screenWidth(context) * .3,
                  height: constraints.maxHeight / 8,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: FittedBox(child: Text(activity.name)),
                      ),
                      PositionedDirectional(
                        bottom: -1,
                        child: Container(
                          color: const Color(0xffE3E3E3),
                          width: screenWidth(context) * .3,
                          height: 1,
                        ),
                      ),
                      PositionedDirectional(
                        end: -1,
                        child: Container(
                          color: const Color(0xffE3E3E3),
                          width: 1,
                          height: constraints.maxHeight / 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ...slots.map((slot) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return EntryForm(
                            slot.date,
                            activityId: activity.id,
                            records: slot.entries
                                .map((v) => {
                                      "first_surah": v.fromAyah.surah_number,
                                      "last_surah": v.toAyah.surah_number,
                                      "first_ayah": v.fromAyah.ayah_number,
                                      "last_ayah": v.toAyah.ayah_number,
                                    })
                                .toList(),
                          );
                        },
                      );
                    },
                    child: Ink(
                      width: screenWidth(context) * .3,
                      height: constraints.maxHeight / 8,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: FittedBox(
                              child: Text(
                                slot.entries.length > 3
                                    ? "click_for_more".translate()
                                    : slot.entries.mapIndexed(((index, v) {
                                        if (v.fromAyah.surah_number ==
                                            v.toAyah.surah_number) {
                                          return "${index != 0 ? "\n" : ""}"
                                              "${v.fromAyah.surah_name_ar} ${v.fromAyah.ayah_number}-${v.toAyah.ayah_number}";
                                        }
                                        return "${index != 0 ? "\n" : ""}"
                                            "${v.fromAyah.surah_name_ar} ${v.fromAyah.ayah_number} -\n${v.toAyah.surah_name_ar} ${v.toAyah.ayah_number}";
                                      })).join(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          if (slot.date.weekday != 6)
                            PositionedDirectional(
                              bottom: 0,
                              child: Container(
                                color: const Color(0xffE3E3E3),
                                width: screenWidth(context) * .3,
                                height: 1,
                              ),
                            ),
                          PositionedDirectional(
                            end: -1,
                            child: Container(
                              color: const Color(0xffE3E3E3),
                              width: 1,
                              height: constraints.maxHeight / 8,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: 4,
                    start: 4,
                    child: Icon(
                      slot.status == SlotStatus.completed
                          ? Icons.check_circle
                          : slot.status == SlotStatus.missed
                              ? Icons.remove_circle_sharp
                              : Icons.circle,
                      color: slot.status == SlotStatus.completed
                          ? Colors.green
                          : slot.status == SlotStatus.missed
                              ? Colors.red
                              : Colors.transparent,
                      size: 20,
                    ),
                  ),
                ],
              );
            })
          ],
        );
      }),
    );
  }
}
