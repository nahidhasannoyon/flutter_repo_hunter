import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

ThemeData light = ThemeData(
  fontFamily: 'Trajan Pro',
  primaryColor: const Color(0xFF2196F3),
  brightness: Brightness.light,
  highlightColor: const Color(0xFFF5F5F5),
  hintColor: const Color(0xFF333333),
  cardColor: const Color(0xFFF8F8F8),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  splashColor: Colors.transparent,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF2196F3),
    secondary: Color(0xFF03A9F4),
    tertiary: Color(0xFFFFC107),
    tertiaryContainer: Color(0xFFFFEB3B),
    surface: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onTertiaryContainer: Color(0xFF0A3D2B),
    primaryContainer: Color(0xFF81D4FA),
    onSecondaryContainer: Color(0xFF212121),
    outline: Color(0xFF00BCD4),
    onTertiary: Color(0xFF212121),
    secondaryContainer: Color(0xFFB3E5FC),
    surfaceContainer: Color(0xFF80DEEA),
  ),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xFF212121))),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    },
  ),
);
