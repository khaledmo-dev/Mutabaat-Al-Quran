import 'package:quran_test/data/database.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<LocalStorageService>();

  final _database = locator<Database>();

  Future runStartupLogic() async {
    try {
      await _database.managers.ayat.limit(1).get();
      // ignore: empty_catches
    } catch (e) {}

    if (_storageService.isFirstOpen) {
      _navigationService.replaceWithOnboardingView();
    } else {
      _navigationService.replaceWithMainView();
    }
  }
}
