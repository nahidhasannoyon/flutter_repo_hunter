import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_repo_hunter/core/config/app_config.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/enums/app_mode.dart';
import '../helpers/translation_helper.dart';

Future<void> initializeApp() async {
  if (AppConfig.appMode == AppMode.development.toString()) {
    await dotenv.load(fileName: ".env.dev"); // Loads the .env file
  } else {
    await dotenv.load(fileName: ".env.prod"); // Loads the .env file
  }
  await GetStorage.init(); // Initialize GetStorage
  await TranslationHelper.initialize(); // Initialize translations
}
