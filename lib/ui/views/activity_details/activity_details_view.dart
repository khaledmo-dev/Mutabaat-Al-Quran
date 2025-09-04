import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/activity_details/monthly_overview/monthly_overview.dart';
import 'package:quran_test/ui/views/table/widgets/activity_form.dart';
import 'package:quran_test/ui/common/date_utils.dart';
import 'package:stacked/stacked.dart';

import 'activity_details_viewmodel.dart';

class ActivityDetailsView extends StackedView<ActivityDetailsViewModel> {
  const ActivityDetailsView(this.id, {Key? key}) : super(key: key);
  final int id;
  @override
  Widget builder(
    BuildContext context,
    ActivityDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(viewModel.data?.name ?? ''),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(),
                context: context,
                builder: (context) {
                  return ActivityForm(activity: viewModel.data);
                },
              );
            },
            icon: const HeroIcon(
              HeroIcons.pencil,
              color: Colors.amber,
              style: HeroIconStyle.solid,
            ),
          ),
          IconButton(
            onPressed: () {
              viewModel.deleteRecord(id);
            },
            icon: const HeroIcon(
              HeroIcons.trash,
              color: kcErrorColor,
              style: HeroIconStyle.solid,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthlyOverview(id),
            verticalSpaceSmall,
            Text(
              "scheduled_days".translate(),
              style: const TextStyle(fontSize: 16),
            ),
            verticalSpaceSmall,
            Wrap(
              runAlignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: Weekday.getOrderedWeekdays(Weekday.sunday)
                  .where((element) => (viewModel.data?.scheduleDays ?? [])
                      .contains(element.order))
                  .map(
                (e) {
                  var value = e;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: const Border(
                        top: BorderSide(width: 1, color: kcPrimaryColor),
                        right: BorderSide(width: 1, color: kcPrimaryColor),
                        bottom: BorderSide(width: 2, color: kcPrimaryColor),
                        left: BorderSide(width: 1, color: kcPrimaryColor),
                      ),
                      color: kcPrimaryColor.withValues(alpha: .1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            value.label,
                            style: const TextStyle(
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
      ),
    );
  }

  @override
  ActivityDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActivityDetailsViewModel(id);
}
