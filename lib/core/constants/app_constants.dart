import '../../data/models/language_model.dart';
import '../utils/images.dart';

class AppConstants {
  static const String appName = 'Flutter App';
  static const String slogan = 'Your Slogan Here';
  static const String appVersion = '1.0.0';

  static const String baseUrl = 'https://api.github.com';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.en,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
  ];

  /* cspell: disable */
  static const List<String> videoExtensions = [
    'mp4',
    'mkv',
    'avi',
    'mov',
    'wmv',
    'flv',
    'webm',
    'mpeg',
    'mpg',
    'm4v',
    '3gp',
    'ogv',
  ];

  static const List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'jpe',
    'jif',
    'jfif',
    'jfi',
    'png',
    'gif',
    'webp',
    'tiff',
    'tif',
    'bmp',
    'svg',
  ];

  static const List<String> documentExtensions = [
    'doc',
    'docx',
    'txt',
    'csv',
    'xls',
    'xlsx',
    'rar',
    'tar',
    'targz',
    'zip',
    'pdf',
  ];

  static const List<String> audioExtensions = [
    'mp3',
    'wav',
    'ogg',
    'flac',
    'aac',
    'wma',
    'm4a',
    'aiff',
    'ape',
    'au',
    'mka',
    'm4b',
    'm4p',
    'm4r',
    'm4v',
    '3ga',
  ];
  /* cspell: enable */
}
