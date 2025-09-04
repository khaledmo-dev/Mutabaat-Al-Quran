import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/activity.dart';
import 'package:quran_test/data/models/entry.dart';
import 'package:quran_test/data/models/slot.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/surahs.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/date_utils.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/table/widgets/entry_form.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivityColumn extends StatelessWidget {
  const ActivityColumn(this.activity, {super.key, required this.index});
  final ActivityModel activity;
  final int index;
  @override
  Widget build(BuildContext context) {
    var outline = Theme.of(context).colorScheme.outline;
    HeroIcons getIcon(SlotModel slot) {
      if (slot.status == SlotStatus.missed) {
        if (slot.date == DateTime.now().dateOnly) {
          return HeroIcons.informationCircle;
        }
        return HeroIcons.minusCircle;
      }
      if (slot.status == SlotStatus.completed) {
        return HeroIcons.checkCircle;
      }

      return HeroIcons.questionMarkCircle;
    }

    Color getColor(SlotModel slot) {
      if (slot.status == SlotStatus.missed) {
        if (slot.date == DateTime.now().dateOnly) {
          return Colors.grey;
        }
        return kcErrorColor;
      }
      if (slot.status == SlotStatus.completed) {
        return kcSuccessColor;
      }

      return Colors.transparent;
    }

    return Material(
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                            color: outline,
                            width: screenWidth(context) * .3,
                            height: 1,
                          ),
                        ),
                        PositionedDirectional(
                          end: -1,
                          child: Container(
                            color: outline,
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
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(),
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
                                  formatEntryText(slot.entries),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            if (slot.date.weekday != 6)
                              PositionedDirectional(
                                bottom: 0,
                                child: Container(
                                  color: outline,
                                  width: screenWidth(context) * .3,
                                  height: 1,
                                ),
                              ),
                            PositionedDirectional(
                              end: -1,
                              child: Container(
                                color: outline,
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
                      child: HeroIcon(
                        getIcon(slot),
                        color: getColor(slot),
                        size: 20,
                        style: HeroIconStyle.solid,
                      ),
                    ),
                  ],
                );
              })
            ],
          );
        },
      ),
    );
  }
}

String formatEntryText(List<EntryModel> entries) {
  if (entries.length > 3) {
    return "click_for_more".translate();
  }

  return entries.mapIndexed(
    ((index, v) {
      String text = "";
      text += index != 0 ? "\n" : "";
      if (v.fromAyah.surah_number == v.toAyah.surah_number) {
        if (v.fromAyah.ayah_number == 1 &&
            v.toAyah.ayah_number == surahMap[v.fromAyah.surah_number]!['aya']) {
          text += v.fromAyah.surah_name_ar;
        } else {
          text +=
              "${v.fromAyah.surah_name_ar} ${v.fromAyah.ayah_number}-${v.toAyah.ayah_number}";
        }
      } else {
        text +=
            "${v.fromAyah.surah_name_ar} ${v.fromAyah.ayah_number} -\n${v.toAyah.surah_name_ar} ${v.toAyah.ayah_number}";
      }

      return text;
    }),
  ).join();
}
