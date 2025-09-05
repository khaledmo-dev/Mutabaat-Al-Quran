import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/main.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreViewModel extends ReactiveViewModel {
  final _localStorageService = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();

  bool get isDark => _localStorageService.isDark;

  bool get isHijri => _localStorageService.isHijri;

  toggleTheme() {
    themeNotifier.value = !_localStorageService.isDark;
    _localStorageService.isDark = !_localStorageService.isDark;
  }

  toggleDate() {
    _localStorageService.isHijri = !_localStorageService.isHijri;
    rebuildUi();
  }

  share() {
    Share.share(
        "${"share_message".translate()}\n https://play.google.com/store/apps/details?id=com.mutabaat.quran");
  }

  rate() {
    launchUrl(
        Uri.parse(
            "https://play.google.com/store/apps/details?id=com.mutabaat.quran"),
        mode: LaunchMode.externalApplication);
  }

  contactUs() {
    launchUrl(Uri.parse('https://wa.me/201099107801'));
  }

  goToResults() {
    _navigationService.navigateToResultsView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_localStorageService, ...super.listenableServices];
}
