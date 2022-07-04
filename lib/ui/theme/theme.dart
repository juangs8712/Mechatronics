import 'package:flutter/material.dart';

import '../../share_prefs/share_prefs.dart';

enum EnumTheme { light, dark, custom }

// --------------------------------------------------------------------------

class ThemeChanger with ChangeNotifier {
  EnumTheme _enumTheme = EnumTheme.light;

  bool get isLightTheme  => _enumTheme == EnumTheme.light;
  bool get isDarkTheme   => _enumTheme == EnumTheme.dark;
  bool get isCustomTheme => _enumTheme == EnumTheme.custom;

  // ------------------------------------------------------------------------
  ThemeData get currentTheme {
    switch (_enumTheme) {
      case EnumTheme.light:
        return _themeDataLight;

      case EnumTheme.dark:
        return _themeDataDark;

      case EnumTheme.custom:
        return _theDataCustom;

      default:
        return _themeDataLight;
    }
  }

  // ------------------------------------------------------------------------
  // definicion del constructor de la clase
  ThemeChanger(int value) {
    _setTheme = fromInt(value);
  }
  EnumTheme get enumTheme => _enumTheme;

  // ------------------------------------------------------------------------
  set _setTheme(EnumTheme theme) {
    _enumTheme = theme;

    notifyListeners();
    final prefs = SharedPrefs();
    prefs.setInt('app_theme', toInt(theme));
  }

  // ------------------------------------------------------------------------
  set darkTheme(bool value) {
    if (value) {
      _setTheme = EnumTheme.dark;
    } else {
      _setTheme = EnumTheme.light;
    }
  }

  // ------------------------------------------------------------------------
  set customTheme(bool value) {
    if (value) {
      _setTheme = EnumTheme.custom;
    } else {
      _setTheme = EnumTheme.light;
    }
  }

  // ------------------------------------------------------------------------
  static int toInt(EnumTheme theme) {
    if (theme == EnumTheme.light) {
      return 0;
    } else if (theme == EnumTheme.dark) {
      return 1;
    } else {
      return 2;
    }
  }

  // ------------------------------------------------------------------------
  static EnumTheme fromInt(int value) {
    if (value == 0) {
      return EnumTheme.light;
    } else if (value == 1) {
      return EnumTheme.dark;
    } else {
      return EnumTheme.custom;
    }
  }

  // ------------------------------------------------------------------------
  // definicion del tema ligth
  final _themeDataLight = ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
    secondary: const Color(0xff264E72),
    onSecondary: Colors.white,
  ));

  // ------------------------------------------------------------------------
  // definicion del tema dark
  final _themeDataDark = ThemeData(
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      dividerColor: Colors.grey,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.pink,
      ));

  // ------------------------------------------------------------------------
  // definicion del tema personalizado
  final _theDataCustom = ThemeData.dark().copyWith(
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: const Color(0xff16202B),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color(0xff48A0EB),
      ));
}

// --------------------------------------------------------------------------
  // final _ParaIdentificar = ThemeData.dark().copyWith(
  //     colorScheme: const ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: Colors.black,
  //   onPrimary: Colors.black,
  //   secondary: Color(0xff48A0EB),
  //   onSecondary: Colors.white, //color por defecto de iconos
  //   error: Colors.red,
  //   onError: Colors.yellow,
  //   background: Colors.black,
  //   onBackground: Colors.white,
  //   surface: Colors.black87, // color del appBar
  //   onSurface: Colors.white, // color del texto en el appBar
  // ));
