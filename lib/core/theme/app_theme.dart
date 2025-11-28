import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const String _fontFamily = 'Figtree';

  // Material Design 3 Typography Scale with Inter font
  static TextTheme get textTheme => const TextTheme(
    // Display styles - largest text, short and important text like page headers
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 57.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: -0.25,
      height: 1.12,
      color: textDark,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 45.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.16,
      color: textDark,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 36.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.22,
      color: textDark,
    ),

    // Headline styles - high-emphasis, shorter text like article headlines
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.25,
      color: textDark,
    ),
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.29,
      color: textDark,
    ),
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.33,
      color: textDark,
    ),

    // Title styles - medium emphasis text like section titles
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.0,
      height: 1.27,
      color: textDark,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.15,
      height: 1.50,
      color: textDark,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.1,
      height: 1.43,
      color: textDark,
    ),

    // Body styles - regular text content
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.15,
      height: 1.50,
      color: textDark,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.25,
      height: 1.43,
      color: textDark,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.4,
      height: 1.33,
      color: textDark,
    ),

    // Label styles - buttons, tabs, and other UI elements
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.1,
      height: 1.43,
      color: textDark,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.5,
      height: 1.33,
      color: textDark,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.5,
      height: 1.45,
      color: textDark,
    ),
  );

  static const primaryBlue = Color(0xFF73E3C6); // Derawan Blue - main color
  static const primaryBlueLight = Color(0xFFA5F0DD); // light variant
  static const primaryBlueDark = Color(0xFF4AC4AD); // dark variant
  static const textDark = Color(0xFF1A233C);
  static const success = Color(0xFF059669);
  static const successLight = Color(0xFFE8F5E9);

  // Custom color scheme for bike app
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryBlue, // Derawan Blue
    onPrimary: Color(0xFFFFFFFF), // White
    primaryContainer: Color(0xFFD4F7EE), // Very light mint
    onPrimaryContainer: Color(0xFF2A9A84), // Dark teal
    secondary: success, // Emerald 600
    onSecondary: Color(0xFFFFFFFF), // White
    secondaryContainer: Color(0xFFD1FAE5), // Emerald 100
    onSecondaryContainer: Color(0xFF064E3B), // Emerald 800
    tertiary: Color(0xFFDC2626), // Red 600
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFEE2E2), // Red 100
    onTertiaryContainer: Color(0xFF991B1B), // Red 800
    error: Color(0xFFDC2626), // Red 600
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2), // Red 100
    onErrorContainer: Color(0xFF991B1B), // Red 800
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF111827), // Gray 900
    surfaceContainerHighest: Color(0xFFF9FAFB), // Gray 50
    onSurfaceVariant: Color(0xFF6B7280), // Gray 500
    outline: Color(0xFFD1D5DB), // Gray 300
    outlineVariant: Color(0xFFF3F4F6), // Gray 100
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF111827), // Gray 900
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: primaryBlueLight, // Light mint
    surfaceTint: primaryBlue, // Derawan Blue
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryBlueLight, // Light mint for dark mode
    onPrimary: Color(0xFF2A9A84), // Dark teal
    primaryContainer: primaryBlueDark, // Dark mint
    onPrimaryContainer: Color(0xFFD4F7EE), // Very light mint
    secondary: Color(0xFF34D399), // Emerald 400
    onSecondary: Color(0xFF064E3B), // Emerald 800
    secondaryContainer: Color(0xFF047857), // Emerald 700
    onSecondaryContainer: Color(0xFFD1FAE5), // Emerald 100
    tertiary: Color(0xFFF87171), // Red 400
    onTertiary: Color(0xFF991B1B), // Red 800
    tertiaryContainer: Color(0xFFDC2626), // Red 600
    onTertiaryContainer: Color(0xFFFEE2E2), // Red 100
    error: Color(0xFFF87171), // Red 400
    onError: Color(0xFF991B1B), // Red 800
    errorContainer: Color(0xFFDC2626), // Red 600
    onErrorContainer: Color(0xFFFEE2E2), // Red 100
    surface: Color(0xFF111827), // Gray 900
    onSurface: Color(0xFFF9FAFB), // Gray 50
    surfaceContainerHighest: Color(0xFF1F2937), // Gray 800
    onSurfaceVariant: Color(0xFF9CA3AF), // Gray 400
    outline: Color(0xFF4B5563), // Gray 600
    outlineVariant: Color(0xFF374151), // Gray 700
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF9FAFB), // Gray 50
    onInverseSurface: Color(0xFF111827), // Gray 900
    inversePrimary: primaryBlueDark, // Dark mint
    surfaceTint: primaryBlueLight, // Light mint
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: textTheme,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent, // <- disables scroll tint globally
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
        disabledBackgroundColor: _lightColorScheme.primaryContainer,
        disabledForegroundColor: _lightColorScheme.onPrimaryContainer,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        textStyle: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: _lightColorScheme.onPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: textTheme,
    colorScheme: _darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
        disabledBackgroundColor: _darkColorScheme.primaryContainer,
        disabledForegroundColor: _darkColorScheme.onPrimaryContainer,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        textStyle: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: _darkColorScheme.onPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
