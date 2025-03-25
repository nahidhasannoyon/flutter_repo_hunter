import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_repo_hunter/domain/enums/app_mode.dart';

class AppConfig {
  static const String appName = 'Flutter App';
  static const String slogan = 'Your Slogan Here';
  static const String appVersion = '1.0.0';

  static String baseUrl = dotenv.env['API_URL']!;
  static String appMode = AppMode.development.toString();
}
