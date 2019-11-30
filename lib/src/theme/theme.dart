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
      iconTheme: IconThemeData(color: kPrimaryLight),
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      textTheme: _darkTextTheme,
      accentColor: kAccentLight,
      primaryColor: kPrimaryDark,
      highlightColor: kAccentLight,
      scaffoldBackgroundColor: kScaffoldBackgroundDark,
      iconTheme: IconThemeData(color: kPrimaryLight),
      errorColor: kErrorColorDark,
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      title: TextStyle(
        fontFamily: 'Asap',
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: kPrimaryText,
      ),
      caption: TextStyle(
        fontFamily: 'Asap',
        fontSize: 17.0,
        color: kPrimaryLight,
        fontWeight: FontWeight.w500,
      ),
      subtitle: TextStyle(
        fontFamily: 'Asap',
        fontSize: 16.0,
      ),
    );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
      title: TextStyle(
        fontFamily: 'Asap',
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: 'Asap',
        fontSize: 18.0,
        color: kPrimaryLight,
        fontWeight: FontWeight.w400,
      ),
      subtitle: TextStyle(
        fontFamily: 'Asap',
        fontSize: 17.0,
      ),
    );
  }
}
