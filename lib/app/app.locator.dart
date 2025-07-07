// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:quran_test/data/database.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/activity_service.dart';
import '../services/local_storage_service.dart';
import '../services/localization_service.dart';
import '../services/result_service.dart';
import '../services/table_service.dart';
import '../services/template_service.dart';
import '../services/test_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Database());
  locator.registerLazySingleton(() => TableService());
  locator.registerLazySingleton(() => TestService());
  locator.registerLazySingleton(() => ActivityService());
  locator.registerLazySingleton(() => ResultService());
  locator.registerLazySingleton(() => TemplateService());
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  locator.registerSingleton(localStorageService);

  final localizationService = LocalizationService();
  await localizationService.init();
  locator.registerSingleton(localizationService);
}
