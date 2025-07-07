import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class LocalizationService implements InitializableDependency {
  final _localStorage = locator<LocalStorageService>();
  static final _localizedValues = <String, Map<String, String>>{};

  Future<void> load(String lang) async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/localizations/$lang.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedValues[lang] =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> changeLanguage(String lang) async {
    if (!_localizedValues.containsKey(lang)) {
      await load(lang);
    }
  }

  static String translate(String text, context) {
    var lan = Localizations.localeOf(context).languageCode;

    return _localizedValues[lan]?[text] ?? text;
  }

  @override
  Future<void> init() async {
    await load(_localStorage.lang);
  }
}

extension StringExtension on String {
  String translate() {
    return LocalizationService.translate(
      this,
      StackedService.navigatorKey!.currentContext!,
    );
  }
}
