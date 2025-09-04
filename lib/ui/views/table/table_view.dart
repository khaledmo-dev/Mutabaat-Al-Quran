import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/table/widgets/activity_form.dart';
import 'package:quran_test/ui/views/table/widgets/activity_column.dart';
import 'package:quran_test/ui/views/table/widgets/date_column.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:stacked/stacked.dart';
import 'table_viewmodel.dart';

class TableView extends StackedView<TableViewModel> {
  const TableView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TableViewModel viewModel,
    Widget? child,
  ) {
    return ValueListenableBuilder(
        valueListenable: languageNotifier,
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: BaseAppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      viewModel.nextWeek();
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Text("${"week".translate()} ${viewModel.weekNumber}"),
                  IconButton(
                    onPressed: () {
                      viewModel.prevWeek();
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    viewModel.changeCalendar();
                  },
                  icon: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        viewModel.isHijri ? kcSuccessColor : kcErrorColor,
                        viewModel.isHijri ? kcSuccessColor : kcErrorColor,
                      ],
                    ).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: Image.asset("assets/calendar.png"),
                  ),
                )
              ],
              leading: IconButton(
                onPressed: () {
                  viewModel.pickDate(context);
                },
                icon: const HeroIcon(
                  HeroIcons.calendarDays,
                  style: HeroIconStyle.solid,
                ),
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (true) {
                    return CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Stack(
                            children: [
                              const DatesColumn(),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(),
                                    context: context,
                                    builder: (context) {
                                      return const ActivityForm();
                                    },
                                  );
                                },
                                child: Ink(
                                  width: screenWidth(context) * .3,
                                  height: constraints.maxHeight / 8,
                                  decoration: BoxDecoration(
                                    border: BorderDirectional(
                                      end: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: HeroIcon(
                                      HeroIcons.squaresPlus,
                                      style: HeroIconStyle.solid,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!viewModel.dataReady)
                          SliverToBoxAdapter(
                            child: Shimmer(
                              duration:
                                  const Duration(seconds: 2), //Default value
                              interval: const Duration(
                                  seconds:
                                      0), //Default value: Duration(seconds: 0)
                              color: Colors.black, //Default value
                              colorOpacity: 0, //Default value
                              enabled: true, //Default value
                              direction: const ShimmerDirection
                                  .fromLTRB(), //Default Value
                              child: Container(
                                color: Colors.blueGrey.withValues(alpha: .1),
                                width: screenWidth(context),
                                height: double.infinity,
                              ),
                            ),
                          ),
                        SliverReorderableList(
                          itemBuilder: (context, index) {
                            var activity = viewModel.activities[index];
                            return ActivityColumn(
                              activity,
                              index: index,
                              key: Key(activity.id.toString()),
                            );
                          },
                          itemCount: viewModel.activities.length,
                          onReorder: (oldIndex, newIndex) {
                            viewModel.reorderAcitivity(oldIndex, newIndex);
                          },
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          );
        });
  }

  @override
  TableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TableViewModel();
}
