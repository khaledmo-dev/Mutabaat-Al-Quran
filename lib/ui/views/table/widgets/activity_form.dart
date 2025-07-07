import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/data/models/activity.dart';
import 'package:quran_test/services/activity_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/base_text_field.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/date_utils.dart';

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key, this.activity});

  final ActivityModel? activity;

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final controller = TextEditingController();

  @override
  initState() {
    if (widget.activity != null) {
      controller.text = widget.activity!.name;
      selectedDays = widget.activity!.scheduleDays;
    }
    super.initState();
  }

  List<int> selectedDays = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseTextField(
              controller: controller,
              hint: 'name'.translate(),
            ),
            verticalSpaceSmall,
            Text(
              'choose_scheduled_days'.translate(),
              style: const TextStyle(fontSize: 16),
            ),
            verticalSpaceSmall,
            Wrap(
              runAlignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: Weekday.values.map(
                (value) {
                  bool isSelected = selectedDays.contains(value.order);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(value.order);
                        } else {
                          selectedDays.add(value.order);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: const Border(
                          top: BorderSide(width: 1, color: kcPrimaryColor),
                          right: BorderSide(width: 1, color: kcPrimaryColor),
                          bottom: BorderSide(width: 2, color: kcPrimaryColor),
                          left: BorderSide(width: 1, color: kcPrimaryColor),
                        ),
                        color: isSelected ? kcPrimaryColor : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              value.label,
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.white : kcPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            verticalSpaceMedium,
            BaseButton(
              title: 'confirm'.translate(),
              callback: () {
                locator<ActivityService>().upsertActivity(
                  activity: ActivitiesCompanion.insert(
                      id: Value.absentIfNull(widget.activity?.id),
                      name: controller.text,
                      order: 0),
                  scheduleDays: selectedDays,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
