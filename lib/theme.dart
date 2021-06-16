import 'package:flutter/material.dart';

final ThemeData mainThemeData = new ThemeData(
    brightness: Brightness.dark,

    primaryColor: MainColors.darkBlue[600],
    primaryColorBrightness: Brightness.light,
    accentColor: MainColors.orange[700],
    accentColorBrightness: Brightness.light,
    cardColor: Colors.white,

    textTheme: TextTheme(
      title: TextStyle(fontFamily: 'LemonYellowSun', fontSize: 24.0), //King's Cup Logo
      subtitle: TextStyle(fontFamily: 'LemonYellowSun', fontSize: 35.0), //Sip Counter
      headline: TextStyle(fontFamily: 'LemonYellowSun', fontSize: 60.0, color: MainColors.orange[600]), //Game Over
      body1: TextStyle(fontFamily: 'LemonYellowSun', fontSize: 35.0, color: MainColors.orange[700]),//Rules on Cards
      button: TextStyle(fontFamily: 'LemonYellowSun', fontSize: 60.0, color: Colors.white),//Draw Button on Card Deck
    )
);

class MainColors {
  MainColors._();

  static const Map<int, Color> darkBlue = const <int, Color> {
    50: const Color(0xFFE5E6EC),
    100: const Color(0xFFBEC0CF),
    200: const Color(0xFF9297AF),
    300: const Color(0xFF666D8E),
    400: const Color(0xFF464D76),
    500: const Color(0xFF252E5E),
    600: const Color(0xFF212956),
    700: const Color(0xFF1B234C),
    800: const Color(0xFF161D42),
    900: const Color(0xFF0D1231)
  };

  static const Map<int, Color> orange = const <int, Color> {
    50: const Color(0xFFFCECE9),
    100: const Color(0xFFF8D1C8),
    200: const Color(0xFFF3B2A4),
    300: const Color(0xFFEE937F),
    400: const Color(0xFFEA7B63),
    500: const Color(0xFFE66448),
    600: const Color(0xFFE35C41),
    700: const Color(0xFFDF5238),
    800: const Color(0xFFDB4830),
    900: const Color(0xFFD53621)
  };
}