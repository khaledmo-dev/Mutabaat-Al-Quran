import 'package:flutter/material.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/services/local_storage_service.dart';

bool get isLightTheme => locator<LocalStorageService>().theme == 'light';

const Color kcPrimaryColorDark = Color(0xff0E8D77);
const Color kcPrimaryColorLight = Color(0xff14B8A6);

const Color kcPrimaryColor = Color(0xFF685634);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xffF1F1F1);
// const Color kcPrimaryColorDark = Color(0xFF300151);
// const Color kcDarkGreyColor = Color(0xFF1A1B1E);
// const Color kcMediumGrey = Color(0xFF474A54);
// const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
// const Color kcVeryLightGrey = Color(0xFFE3E3E3);
// const Color kcBackgroundColor = kcDarkGreyColor;
