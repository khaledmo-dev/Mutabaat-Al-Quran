import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/base_button.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: PageView(
            children: [
              Column(
                children: [
                  Text(
                    "choose_lang".translate(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  verticalSpaceMedium,
                  ...viewModel.langs.map(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () {
                            viewModel.changeLanguage(e);
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Ink(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: viewModel.selected == e
                                  ? kcPrimaryColor
                                  : null,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SvgPicture.asset(
                                    "assets/flags/${e.image}",
                                    height: 42,
                                    width: 42,
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    color: viewModel.selected == e
                                        ? Colors.white
                                        : null,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  BaseButton(
                    title: "confirm".translate(),
                    callback: () {
                      viewModel.confirm();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
