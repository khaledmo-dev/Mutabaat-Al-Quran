import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/activity_details/monthly_overview/monthly_overview.dart';
import 'package:quran_test/ui/views/table/widgets/activity_form.dart';
import 'package:quran_test/date_utils.dart';
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
                  return ActivityForm(activity: viewModel.data);
                },
              );
            },
            icon: const Icon(
              IconlyBold.edit,
              color: Colors.amber,
            ),
          ),
          IconButton(
            onPressed: () {
              viewModel.deleteRecord(id);
            },
            icon: const Icon(
              IconlyBold.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
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
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(
                        top: BorderSide(width: 1, color: kcPrimaryColor),
                        right: BorderSide(width: 1, color: kcPrimaryColor),
                        bottom: BorderSide(width: 2, color: kcPrimaryColor),
                        left: BorderSide(width: 1, color: kcPrimaryColor),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            value.label,
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
      ),
    );
  }

  @override
  ActivityDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActivityDetailsViewModel(id);
}
