import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/models/activity.dart';
import 'package:quran_test/services/activity_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivityDetailsViewModel extends StreamViewModel<ActivityModel> {
  final int id;
  ActivityDetailsViewModel(this.id);

  final _activityService = locator<ActivityService>();

  deleteRecord(int id) async {
    var value = await locator<DialogService>().showConfirmationDialog(
      barrierDismissible: true,
      title: 'confirm_delete_activity'.translate(),
      description: 'delete_activity_message'.translate(),
      confirmationTitle: 'confirm'.translate(),
      cancelTitle: 'cancel'.translate(),
      confirmationTitleColor: Colors.red,
      cancelTitleColor: kcPrimaryColor,
    );
    if (value?.confirmed == true) {
      _activityService.deleteActivity(id);
      locator<NavigationService>().back();
    }
  }

  @override
  Stream<ActivityModel> get stream => _activityService.watchActivity(id);
}
