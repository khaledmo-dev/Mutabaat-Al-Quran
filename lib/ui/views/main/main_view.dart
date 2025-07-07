import 'package:flutter/material.dart';
import 'package:quran_test/ui/common/base_bottom_bar.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: viewModel.pages,
      ),
      bottomNavigationBar: BaseBottomBar(
        views: viewModel.views,
        currentIndex: viewModel.currentIndex,
        setIndex: viewModel.setIndex,
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
