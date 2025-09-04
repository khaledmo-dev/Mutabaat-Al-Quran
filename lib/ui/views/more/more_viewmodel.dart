import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MoreViewModel extends BaseViewModel {
  final _localStorageService = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();

  bool get isDark => _localStorageService.isDark;

  toggleTheme() {
    themeNotifier.value = !_localStorageService.isDark;
    _localStorageService.isDark = !_localStorageService.isDark;
  }

  goToResults() {
    _navigationService.navigateToResultsView();
  }
}
