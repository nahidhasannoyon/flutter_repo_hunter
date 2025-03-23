import 'package:get_storage/get_storage.dart';

import '../helpers/translation_helper.dart';

Future<void> initializeApp() async {
  await GetStorage.init(); // Initialize GetStorage
  await TranslationHelper.initialize(); // Initialize translations
}
