import 'package:quran_test/data/database.dart';
import 'package:quran_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:quran_test/ui/views/home/home_view.dart';
import 'package:quran_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quran_test/ui/views/test/test_view.dart';
import 'package:quran_test/ui/views/main/main_view.dart';
import 'package:quran_test/ui/views/table/table_view.dart';
import 'package:quran_test/ui/views/results/results_view.dart';
import 'package:quran_test/ui/views/result_details/result_details_view.dart';
import 'package:quran_test/services/table_service.dart';
import 'package:quran_test/ui/views/activity_details/activity_details_view.dart';
import 'package:quran_test/services/test_service.dart';
import 'package:quran_test/services/activity_service.dart';
import 'package:quran_test/services/result_service.dart';
import 'package:quran_test/services/template_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/local_storage_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TestView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: TableView),
    MaterialRoute(page: ResultsView),
    MaterialRoute(page: ResultDetailsView),
    MaterialRoute(page: ActivityDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Database),
    LazySingleton(classType: TableService),
    LazySingleton(classType: TestService),
    LazySingleton(classType: ActivityService),
    LazySingleton(classType: ResultService),
    LazySingleton(classType: TemplateService),
    InitializableSingleton(classType: LocalStorageService),
    InitializableSingleton(classType: LocalizationService),
// @stacked-service
  ],
  // bottomsheets: [
  //   // @stacked-bottom-sheet
  // ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
