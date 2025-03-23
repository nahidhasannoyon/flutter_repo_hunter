import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/config/app_bindings.dart';
import 'core/config/app_initializer.dart';
import 'core/config/app_logger.dart';
import 'core/helpers/translation_helper.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Repo Hunter',
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      enableLog: true,
      defaultTransition: Transition.fade,
      locale: TranslationHelper.locale,
      fallbackLocale: TranslationHelper.fallbackLocale,
      translations: TranslationHelper(),
      supportedLocales: TranslationHelper.availableLanguages,
      themeMode: AppTheme.themeMode,
      theme: AppTheme.currentTheme,
      logWriterCallback: AppLogger().localLogWriter,
    ),
  );
}
