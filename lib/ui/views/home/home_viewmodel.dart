import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/template.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/template_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<TemplateModel>> {
  final _templateService = locator<TemplateService>();
  final _navigationService = locator<NavigationService>();

  List<TemplateModel> get templates => data ?? [];

  startTest(List<Segment> segments) async {
    final Set<int> range = {};

    for (final segment in segments) {
      for (int i = segment.from.id; i <= segment.to.id; i++) {
        range.add(i);
      }
    }

    _navigationService.navigateToTestView(range: range.toList());
  }

  deleteTemplate(TemplateModel template) async {
    var value = await locator<DialogService>().showConfirmationDialog(
      barrierDismissible: true,
      title: 'confirm_delete_record'.translate(),
      confirmationTitle: 'confirm'.translate(),
      cancelTitle: 'cancel'.translate(),
      confirmationTitleColor: Colors.red,
      cancelTitleColor: kcPrimaryColor,
    );
    if (value?.confirmed == true) {
      _templateService.deleteTemplate(template.id);
    }
  }

  @override
  Stream<List<TemplateModel>> get stream => _templateService.watchTemplates();
}
