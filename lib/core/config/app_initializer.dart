import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

Future<void> initializeApp() async {
  if (AppConfig.appMode == AppMode.development.toString()) {
    await dotenv.load(fileName: ".env.dev"); // Loads the .env file
    if (kDebugMode) {
      print("App is running in development mode");
    }
  } else {
    await dotenv.load(fileName: ".env.prod"); // Loads the .env file
    if (kDebugMode) {
      print("App is running in production mode");
    }
  }

  await GetStorage.init(); // Initialize GetStorage
  await TranslationHelper.initialize(); // Initialize translations
}
