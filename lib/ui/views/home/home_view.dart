import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/data/models/template.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/views/home/widgets/custome_test_form.dart';
import 'package:quran_test/ui/views/home/widgets/drawer.dart';
import 'package:quran_test/ui/views/home/widgets/template_form.dart';
import 'package:stacked/stacked.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return ValueListenableBuilder(
        valueListenable: languageNotifier,
        builder: (context, value, child) {
          return Scaffold(
            appBar: BaseAppBar(
              enableLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/icon.png'),
                )
              ],
            ),
            drawer: const HomeDrawer(),
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton.extended(
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
                    return const TemplateForm();
                  },
                );
              },
              backgroundColor: kcPrimaryColor,
              label: Text("add_template".translate()),
            ),
            body: Builder(
              builder: (context) {
                if (true) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: BaseButton(
                            title: "start_new_test".translate(),
                            callback: () {
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
                                  return const CustomeTestForm();
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'templates'.translate(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                                verticalSpaceSmall,
                                ...viewModel.templates.map(
                                  (template) {
                                    return GestureDetector(
                                      onTap: () {
                                        viewModel.startTest(template.segments);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        margin:
                                            const EdgeInsets.only(bottom: 12.0),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Colors.blueGrey
                                                .withValues(alpha: .2),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  template.name,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  splashRadius: 20,
                                                  onPressed: () {
                                                    viewModel.deleteTemplate(
                                                        template);
                                                  },
                                                  icon: const Icon(
                                                    IconlyBold.delete,
                                                    color: Colors.red,
                                                  ),
                                                )
                                              ],
                                            ),
                                            verticalSpaceSmall,
                                            SegmentsList(template.segments),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          );
        });
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class SegmentsList extends StatelessWidget {
  const SegmentsList(
    this.segments, {
    super.key,
  });

  final List<Segment> segments;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 6,
      runSpacing: 6,
      children: segments.map(
        (e) {
          String text = "";
          if (e.from.surah_number == e.to.surah_number) {
            text =
                "${e.from.ayah_number} - ${e.to.ayah_number} ${e.from.surah_name_ar} ";
          } else {
            text =
                "${e.from.ayah_number} ${e.from.surah_name_ar} - ${e.to.ayah_number} ${e.to.surah_name_ar}";
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
    );
  }
}
