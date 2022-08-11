import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: bgDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //backgroundColor: MaterialStateProperty.all(secondaryBlueShadeDark),
        //background color
        primary: secondaryBlueShadeDark,
        //text color
        onPrimary: textWhiteShadeLight,
      ),
    ),
    //will make all the text addptive to darkmode
    colorScheme: const ColorScheme.dark(),
    primaryColor: primaryDark,
    //backgroundColor: secondaryBlueShadeDark,
    //buttonTheme: const ButtonThemeData(
    //  buttonColor: secondaryBlueShadeDark,
    //  colorScheme: ColorScheme.dark(),
    //  textTheme: ButtonTextTheme.primary,
    //),
    //buttonBarTheme: const ButtonBarThemeData(
    //  buttonTextTheme: ButtonTextTheme.primary,
    //),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    //make the text color adaptive to light mode
    colorScheme: const ColorScheme.light(),
  );
}
