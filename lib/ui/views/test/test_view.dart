import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'test_viewmodel.dart';

class TestView extends StackedView<TestViewModel> {
  const TestView(this.range, {Key? key, this.testId}) : super(key: key);
  final List<int> range;
  final int? testId;
  @override
  Widget builder(
    BuildContext context,
    TestViewModel viewModel,
    Widget? child,
  ) {
    var ayat = viewModel.ayat;
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          viewModel.confirmLeave();
        }
      },
      child: Scaffold(
        appBar: BaseAppBar(
          title: Text("test".translate()),
          leading: IconButton(
            onPressed: () {
              viewModel.confirmLeave();
            },
            icon: HeroIcon(
              !isRTL ? HeroIcons.arrowLeftCircle : HeroIcons.arrowRightCircle,
              style: HeroIconStyle.solid,
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            if (viewModel.ayat.isEmpty) {
              return Container();
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewModel.showName();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? "assets/banner-dark.svg"
                                    : "assets/banner-light.svg",
                                width: double.infinity,
                                height: (screenWidth(context) - 40) * .11,
                              ),
                              Text(
                                viewModel.isNameShown
                                    ? ayat.first.surah_name_ar
                                    : ".......",
                                style: const TextStyle(
                                  fontFamily: "hafs",
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        MoreText(text: ayat.first.ayah_text),
                        verticalSpaceSmall,
                        Text(
                          "to_ayah".translate(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        verticalSpaceSmall,
                        MoreText(text: ayat.last.ayah_text),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: BaseButton(
                              title: "incorrect".translate(),
                              callback: () {
                                viewModel.selectAnswer(false);
                              },
                              isFilled: true,
                              height: 48,
                              color: Colors.red,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Expanded(
                            child: BaseButton(
                              title: "show_ayat".translate(),
                              callback: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(),
                                  context: context,
                                  builder: (context) {
                                    return AyatSheet(ayat);
                                  },
                                );
                              },
                              isFilled: false,
                              height: 48,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Expanded(
                            child: BaseButton(
                              title: "correct".translate(),
                              callback: () {
                                viewModel.selectAnswer(true);
                              },
                              isFilled: true,
                              height: 48,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      BaseButton(
                        title: "finish_test".translate(),
                        callback: () {
                          viewModel.finishTest();
                        },
                        height: 48,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  TestViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TestViewModel(range);
}

class MoreText extends StatefulWidget {
  const MoreText({super.key, required this.text, this.padding = 16});

  final String text;
  final double padding;
  @override
  State<MoreText> createState() => _MoreTextState();
}

class _MoreTextState extends State<MoreText> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          setState(() {
            showMore = !showMore;
          });
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: kcPrimaryColor.withValues(alpha: .05),
          ),
          child: Text(
            widget.text,
            overflow: showMore ? null : TextOverflow.ellipsis,
            style: const TextStyle(fontFamily: "hafs", fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class AyatSheet extends StatefulWidget {
  const AyatSheet(this.ayat, {super.key});
  final List<Ayah> ayat;

  @override
  State<AyatSheet> createState() => _AyatSheetState();
}

class _AyatSheetState extends State<AyatSheet> {
  late Ayah ayah;
  @override
  void initState() {
    ayah = widget.ayat.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "ayat".translate(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const HeroIcon(
                      HeroIcons.xCircle,
                      style: HeroIconStyle.solid,
                      color: kcErrorColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Text(
              ayah.ayah_text,
              style: const TextStyle(fontFamily: "hafs", fontSize: 16),
              textDirection: TextDirection.rtl,
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (widget.ayat.indexOf(ayah) != widget.ayat.length - 1) {
                      setState(() {
                        ayah = widget.ayat[widget.ayat.indexOf(ayah) + 1];
                      });
                    }
                  },
                  icon: HeroIcon(
                    isRTL
                        ? HeroIcons.arrowRightCircle
                        : HeroIcons.arrowLeftCircle,
                    color: widget.ayat.indexOf(ayah) == widget.ayat.length - 1
                        ? Colors.grey.withValues(alpha: .1)
                        : kcPrimaryColor,
                    style: HeroIconStyle.solid,
                  ),
                ),
                horizontalSpaceMedium,
                Text(ayah.ayah_number.toString()),
                horizontalSpaceMedium,
                IconButton(
                  onPressed: () {
                    if (widget.ayat.indexOf(ayah) != 0) {
                      setState(() {
                        ayah = widget.ayat[widget.ayat.indexOf(ayah) - 1];
                      });
                    }
                  },
                  icon: HeroIcon(
                    isRTL
                        ? HeroIcons.arrowLeftCircle
                        : HeroIcons.arrowRightCircle,
                    color: widget.ayat.indexOf(ayah) == 0
                        ? Colors.grey.withValues(alpha: .1)
                        : kcPrimaryColor,
                    style: HeroIconStyle.solid,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
