import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/app_strings.dart';
import 'dart_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static final GetStorage _storage = GetStorage();

  /// Retrieve the theme mode saved in local storage, defaulting to system theme if not found
  static ThemeMode get themeMode {
    String? savedTheme = _storage.read(AppStrings.themeKey);

    if (savedTheme != null) {
      return savedTheme == AppStrings.darkMode
          ? ThemeMode.dark
          : ThemeMode.light;
    }

    return ThemeMode.system;
  }

  /// Updates the theme mode and saves it in GetStorage
  static void updateTheme(ThemeMode newThemeMode) {
    _storage.write(
      AppStrings.themeKey,
      newThemeMode == ThemeMode.dark
          ? AppStrings.darkMode
          : AppStrings.lightMode,
    );
    Get.changeThemeMode(newThemeMode);
  }

  /// Returns the correct theme based on the current theme mode
  static ThemeData get currentTheme {
    return themeMode == ThemeMode.dark ? dark : light;
  }
}
