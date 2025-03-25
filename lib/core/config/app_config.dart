import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class AppConfig {
  static const String appName = 'Flutter App';
  static const String slogan = 'Your Slogan Here';
  static const String appVersion = '1.0.0';

  // Provide a fallback value if the API_URL is not found
  static String get baseUrl {
    final url = dotenv.env['API_URL'];
    if (url == null) {
      throw Exception("API_URL is not defined in the environment file.");
    }
    return url;
  }

  static String appMode = AppMode.development.toString();
}
