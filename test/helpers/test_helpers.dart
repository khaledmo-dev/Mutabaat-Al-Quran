import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quran_test/services/table_service.dart';
import 'package:quran_test/services/test_service.dart';
import 'package:quran_test/services/activity_service.dart';
import 'package:quran_test/services/result_service.dart';
import 'package:quran_test/services/template_service.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/local_storage_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TableService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TestService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ActivityService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ResultService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TemplateService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalizationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterTableService();
  getAndRegisterTestService();
  getAndRegisterActivityService();
  getAndRegisterResultService();
  getAndRegisterTemplateService();
  getAndRegisterLocalizationService();
  getAndRegisterLocalStorageService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockTableService getAndRegisterTableService() {
  _removeRegistrationIfExists<TableService>();
  final service = MockTableService();
  locator.registerSingleton<TableService>(service);
  return service;
}

MockTestService getAndRegisterTestService() {
  _removeRegistrationIfExists<TestService>();
  final service = MockTestService();
  locator.registerSingleton<TestService>(service);
  return service;
}

MockActivityService getAndRegisterActivityService() {
  _removeRegistrationIfExists<ActivityService>();
  final service = MockActivityService();
  locator.registerSingleton<ActivityService>(service);
  return service;
}

MockResultService getAndRegisterResultService() {
  _removeRegistrationIfExists<ResultService>();
  final service = MockResultService();
  locator.registerSingleton<ResultService>(service);
  return service;
}

MockTemplateService getAndRegisterTemplateService() {
  _removeRegistrationIfExists<TemplateService>();
  final service = MockTemplateService();
  locator.registerSingleton<TemplateService>(service);
  return service;
}

MockLocalizationService getAndRegisterLocalizationService() {
  _removeRegistrationIfExists<LocalizationService>();
  final service = MockLocalizationService();
  locator.registerSingleton<LocalizationService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
