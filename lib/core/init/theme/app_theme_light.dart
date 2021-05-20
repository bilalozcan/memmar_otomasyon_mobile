import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/init/theme/app_theme.dart';
import 'package:memmar_otomasyon_mobile/core/init/theme/light/light_theme_interface.dart';


class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData();
}
