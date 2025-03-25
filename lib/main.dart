import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

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
