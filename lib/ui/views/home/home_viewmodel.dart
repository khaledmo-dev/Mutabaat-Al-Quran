import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/models/template.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/template_service.dart';
import 'package:quran_test/ui/common/app_colors.dart';
import 'package:quran_test/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<TemplateModel>> {
  // final _databaseService = locator<DatabaseService>();
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

  goToResults() {
    _navigationService.navigateToResultsView();
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

class Lang {
  final String name;
  final String code;
  final String image;

  Lang({required this.name, required this.code, required this.image});
}

class SetLanguageSheet extends StatefulWidget {
  const SetLanguageSheet({super.key});
  @override
  State<SetLanguageSheet> createState() => _SetLanguageSheetState();
}

class _SetLanguageSheetState extends State<SetLanguageSheet> {
  final LocalStorageService localStorage = locator<LocalStorageService>();
  final List<Lang> langs = [
    Lang(name: 'العربية', code: 'ar', image: ''),
    Lang(name: 'English', code: 'en', image: ''),
    Lang(name: 'Bahasa Indonesia', code: 'id', image: ''),
    Lang(name: 'اُردُو', code: 'ur', image: ''),
  ];

  late String lang;

  @override
  void initState() {
    super.initState();
    lang = localStorage.lang;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: langs.map((l) {
            return GestureDetector(
              onTap: () async {
                await locator<LocalizationService>().changeLanguage(l.code);
                HomeViewModel().rebuildUi();

                setState(() {
                  lang = l.code;
                  localStorage.lang = lang;
                  languageNotifier.value = lang;
                });
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        horizontalSpaceSmall,
                        Text(l.name),
                      ],
                    ),
                    IgnorePointer(
                      child: Radio(
                        value: true,
                        groupValue: l.code == lang,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
