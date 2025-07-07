import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/data/models/answer.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_bar.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:quran_test/ui/views/test/test_view.dart';
import 'package:stacked/stacked.dart';

import 'result_details_viewmodel.dart';

class ResultDetailsView extends StackedView<ResultDetailsViewModel> {
  const ResultDetailsView(this.id, {Key? key}) : super(key: key);
  final int id;
  @override
  Widget builder(
    BuildContext context,
    ResultDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const BaseAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "questions".translate(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: viewModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                var value = viewModel.data![index];
                return AnswerTile(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  ResultDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResultDetailsViewModel(id);
}

class AnswerTile extends StatefulWidget {
  const AnswerTile(
    this.answer, {
    super.key,
  });

  final AnswerModel answer;

  @override
  State<AnswerTile> createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile>
    with SingleTickerProviderStateMixin {
  final controller = ExpansibleController();

  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      upperBound: 0.5,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var answer = widget.answer;
    Color color = widget.answer.isCorrect ? Colors.green : Colors.red;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Expansible(
        headerBuilder: (context, _) {
          return GestureDetector(
            onTap: () {
              if (controller.isExpanded) {
                controller.collapse();
                _animationController.reverse(from: 0.5);
              } else {
                controller.expand();
                _animationController.forward(from: 0.5);
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color:
                    controller.isExpanded ? color : color.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${answer.fromAyah.surah_name_ar} ${answer.fromAyah.ayah_number} - ${answer.toAyah.ayah_number}",
                    style: TextStyle(
                      fontSize: 16,
                      color: controller.isExpanded ? Colors.white : null,
                    ),
                  ),
                  RotationTransition(
                      turns: Tween<double>(begin: 0.0, end: 1.0)
                          .animate(_animationController),
                      child: Icon(
                        IconlyBold.arrow_down_2,
                        color: controller.isExpanded ? Colors.white : color,
                      )),
                ],
              ),
            ),
          );
        },
        bodyBuilder: (context, _) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey.withValues(alpha: .1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                MoreText(
                  text: answer.fromAyah.ayah_text,
                  padding: 8.0,
                ),
                verticalSpaceSmall,
                MoreText(
                  text: answer.toAyah.ayah_text,
                  padding: 8.0,
                ),
              ],
            ),
          );
        },
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}
