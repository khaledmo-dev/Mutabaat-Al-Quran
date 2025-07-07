import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/result.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/result_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResultsViewModel extends StreamViewModel<List<ResultModel>> {
  final _resultService = locator<ResultService>();
  final _navigationService = locator<NavigationService>();

  List<ResultModel> get results => data ?? [];

  goToDetails(ResultModel result) {
    _navigationService.navigateToResultDetailsView(id: result.id);
  }

  deleteRecord(int id) async {
    var value = await locator<DialogService>().showConfirmationDialog(
      barrierDismissible: true,
      title: 'confirm_delete_record'.translate(),
      confirmationTitle: 'confirm'.translate(),
      cancelTitle: 'cancel'.translate(),
      confirmationTitleColor: Colors.red,
      cancelTitleColor: kcPrimaryColor,
    );
    if (value?.confirmed == true) {
      _resultService.deleteResult(id);
    }
  }

  @override
  Stream<List<ResultModel>> get stream => _resultService.watchResults();
}
