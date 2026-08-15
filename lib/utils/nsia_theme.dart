
import 'package:flutter/material.dart';

/// Charte graphique NSIA INVEST
class NsiaColors {
  NsiaColors._();

  static const Color primaryBlue = Color(0xFF003B7A);
  static const Color primaryBlueDark = Color(0xFF002B5C);
  static const Color gold = Color(0xFFD5B23A);
  static const Color background = Color(0xFFF5F7FA);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1C1C28);
  static const Color textGrey = Color(0xFF8A8FA3);
  static const Color negative = Color(0xFF1C1C28);
  static const Color shadow = Color(0x1A003B7A);
}

class NsiaTheme {
  NsiaTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: NsiaColors.background,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
        seedColor: NsiaColors.primaryBlue,
        primary: NsiaColors.primaryBlue,
        secondary: NsiaColors.gold,
        surface: NsiaColors.cardWhite,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: NsiaColors.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: NsiaColors.primaryBlue),
        titleTextStyle: TextStyle(
          color: NsiaColors.primaryBlue,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: NsiaColors.textDark,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(color: NsiaColors.textDark, fontSize: 14),
        bodySmall: TextStyle(color: NsiaColors.textGrey, fontSize: 12),
      ),
    );
  }

  /// Style d'ombre douce utilisé pour toutes les cartes
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: NsiaColors.shadow,
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}
