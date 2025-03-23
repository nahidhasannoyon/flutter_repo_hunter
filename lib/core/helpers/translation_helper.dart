import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repo_hunter/core/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/app_strings.dart';

class TranslationHelper extends Translations {
  static final GetStorage _storage = GetStorage();
  static final Map<String, Map<String, String>> _localizedStrings = {};
  static List<Locale> availableLanguages = [];

  /// Loads available languages from assets
  static Future<void> initialize() async {
    availableLanguages = await _getAvailableLanguages();
    await _loadAllTranslations();
  }

  /// Determines the current locale based on storage, device locale, or default
  static Locale get locale {
    String? savedLang = _storage.read(AppStrings.langKey);

    if (savedLang != null) {
      Locale storedLocale = _parseLocale(savedLang);
      if (availableLanguages.contains(storedLocale)) {
        return storedLocale;
      }
    }

    Locale? deviceLocale = Get.deviceLocale;
    if (deviceLocale != null &&
        availableLanguages.any(
          (locale) =>
              locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode,
        )) {
      return deviceLocale;
    }

    return fallbackLocale;
  }

  /// Returns the first available language as fallback
  static Locale get fallbackLocale =>
      availableLanguages.isNotEmpty
          ? availableLanguages.first
          : const Locale('en', 'US');

  /// Parses a locale string (e.g., "en_US") into a Locale object
  static Locale _parseLocale(String localeString) {
    var parts = localeString.split('_');
    return Locale(parts[0], parts.length > 1 ? parts[1] : '');
  }

  /// Retrieves available languages by checking the existence of translation files
  static Future<List<Locale>> _getAvailableLanguages() async {
    List<Locale> locales = [];

    for (var lang in AppConstants.languages) {
      Locale locale = Locale(lang.languageCode!, lang.countryCode!);

      if (await _isTranslationAvailable(locale)) {
        locales.add(locale);
      }
    }
    return locales;
  }

  /// Checks if a translation file exists for the given locale
  static Future<bool> _isTranslationAvailable(Locale locale) async {
    String path =
        'assets/translations/${locale.languageCode}_${locale.countryCode}.json';
    try {
      await rootBundle.loadString(path);
      return true;
    } catch (e) {
      debugPrint("Translation file not found: $path");
      return false;
    }
  }

  /// Loads translations from JSON files into memory
  static Future<void> _loadAllTranslations() async {
    for (var language in availableLanguages) {
      String filePath =
          'assets/translations/${language.languageCode}_${language.countryCode}.json';
      try {
        String jsonString = await rootBundle.loadString(filePath);
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        _localizedStrings["${language.languageCode}_${language.countryCode}"] =
            jsonMap.map((key, value) => MapEntry(key, value.toString()));
      } catch (e) {
        debugPrint("Error loading translation file: $filePath");
      }
    }
  }

  /// Updates the current locale and saves it in GetStorage
  void updateLocale(Locale newLocale) {
    _storage.write(
      AppStrings.langKey,
      "${newLocale.languageCode}_${newLocale.countryCode}",
    );
    Get.updateLocale(newLocale);
  }

  @override
  Map<String, Map<String, String>> get keys => _localizedStrings;
}
