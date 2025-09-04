import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/ui/views/more/more_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  final localStorage = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();

  final List<Lang> langs = [
    Lang(name: 'العربية', code: 'ar', image: 'arab.svg'),
    Lang(name: 'English', code: 'en', image: 'gb.svg'),
    Lang(name: 'Bahasa Indonesia', code: 'id', image: 'id.svg'),
    Lang(name: 'اُردُو', code: 'ur', image: 'pk.svg'),
  ];

  Lang? selected;

  changeLanguage(Lang lang) async {
    await locator<LocalizationService>().changeLanguage(lang.code);

    selected = lang;
    localStorage.lang = lang.code;
    languageNotifier.value = lang.code;
    rebuildUi();
  }

  confirm() {
    localStorage.isFirstOpen = false;
    _navigationService.replaceWithMainView();
  }
}
