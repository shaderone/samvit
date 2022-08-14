import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: bgDark,
    fontFamily: "Poppins",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgDark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //backgroundColor: MaterialStateProperty.all(secondaryBlueShadeDark),
        //background color
        primary: secondaryBlueShadeDark,
        //text color
        onPrimary: pureWhite,
      ),
    ),
    // custom material you navbar theme
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: bottomNavDark,
      indicatorColor: pureWhite,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(
          color: secondaryBlueShadeDark,
        ),
      ),
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
        ),
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
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    //make the text color adaptive to light mode
    colorScheme: const ColorScheme.light(),
  );
}
