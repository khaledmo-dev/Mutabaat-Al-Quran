import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'results_viewmodel.dart';

class ResultsView extends StackedView<ResultsViewModel> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResultsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('results'.translate())),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: viewModel.results.length,
        itemBuilder: (context, index) {
          var result = viewModel.results[index];
          return GestureDetector(
            onTap: () {
              viewModel.goToDetails(result);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.blueGrey.withValues(alpha: .2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        result.name ?? "${"test".translate()} ${result.id}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          viewModel.deleteRecord(result.id);
                        },
                        icon: const Icon(IconlyBold.delete),
                        color: Colors.red,
                        visualDensity: VisualDensity.compact,
                      )
                    ],
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${"correct_answers".translate()}: ${result.totalCorrect}',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${"incorrect_answers".translate()}: ${result.totalMistake}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  ResultsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResultsViewModel();
}
