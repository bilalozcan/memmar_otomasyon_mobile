import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/constants/enums/app_theme_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData? _currentTheme = AppThemeLight.instance?.theme;
  ThemeData? get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance?.theme;
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
