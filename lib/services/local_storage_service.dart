import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService
    with ListenableServiceMixin
    implements InitializableDependency {
  late SharedPreferences sharedPreferences;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    listenToReactiveValues([isHijri]);
  }

  dynamic _getFromDisk(String key) {
    var value = sharedPreferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    var preferences = sharedPreferences;
    // logger.d(
    //     '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    if (content is String) {
      preferences.setString(key, content);
    }
    if (content is bool) {
      preferences.setBool(key, content);
    }
    if (content is int) {
      preferences.setInt(key, content);
    }
    if (content is double) {
      preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      preferences.setStringList(key, content);
    }
  }

  static const String themeKey = 'theme';

  String get theme {
    return _getFromDisk(themeKey) ?? "light";
  }

  set theme(String theme) {
    _saveToDisk(themeKey, theme);
  }

  static const String langKey = 'lang';

  String get lang {
    return _getFromDisk(langKey) ?? 'ar';
  }

  set lang(String lang) {
    _saveToDisk(langKey, lang);
  }

  static const String isHijriKey = 'isHijri';

  bool get isHijri {
    return _getFromDisk(isHijriKey) ?? false;
  }

  set isHijri(bool isHijri) {
    _saveToDisk(isHijriKey, isHijri);
  }
}
