import 'package:flutter/material.dart';
import 'package:quran_test/app/app.dialogs.dart';
import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/services/local_storage_service.dart';
import 'package:quran_test/ui/common/theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var languageNotifier = ValueNotifier('ar');
var themeNotifier = ValueNotifier<bool?>(null);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  languageNotifier.value = locator<LocalStorageService>().lang;
  themeNotifier.value = locator<LocalStorageService>().isDark;

  setupDialogUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeValue, child) {
        return ValueListenableBuilder(
          valueListenable: languageNotifier,
          builder: (context, value, child) {
            bool isRTL = languageNotifier.value == 'ar' ||
                languageNotifier.value == 'ur';

            return MaterialApp(
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
              theme: AppTheme.light.copyWith(
                textTheme: AppTheme.light.textTheme
                    .apply(fontFamily: isRTL ? 'cairo' : 'poppins'),
              ),
              darkTheme: AppTheme.dark.copyWith(
                textTheme: AppTheme.dark.textTheme
                    .apply(fontFamily: isRTL ? 'cairo' : 'poppins'),
              ),
              themeMode: themeValue == null
                  ? ThemeMode.system
                  : themeValue
                      ? ThemeMode.dark
                      : ThemeMode.light,
              supportedLocales: const [
                Locale("en"),
                Locale("ar"),
                Locale("ur"),
                Locale("id")
              ],
              locale: Locale(languageNotifier.value),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}
