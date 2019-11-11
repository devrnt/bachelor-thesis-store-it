import 'package:flutter/material.dart';
import 'package:store_it/src/theme/colors.dart';

class Theme {
  static final ThemeData baseLight = ThemeData.light();
  static final ThemeData baseDark = ThemeData.dark();

  static ThemeData get lightTheme {
    return baseLight.copyWith(
      textTheme: _lightTextTheme,
      accentColor: kAccent,
      primaryColor: kPrimary,
      scaffoldBackgroundColor: kScaffoldBackground,
      highlightColor: kAccentLight,
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      textTheme: _darkTextTheme,
      accentColor: kAccentLight,
      primaryColor: kPrimaryDark,
      highlightColor: kAccentLight,
      scaffoldBackgroundColor: kScaffoldBackgroundDark,
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      title: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: kPrimaryText,
      ),
      caption: TextStyle(
        fontSize: 18.0,
        color: kPrimaryLight,
        fontWeight: FontWeight.w400,
      ),
      subtitle: TextStyle(
        fontSize: 17.0,
      ),
    );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
      title: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontSize: 18.0,
        color: kPrimaryLight,
        fontWeight: FontWeight.w400,
      ),
      subtitle: TextStyle(
        fontSize: 17.0,
      ),
    );
  }
}
