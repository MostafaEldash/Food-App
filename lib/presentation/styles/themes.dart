import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes {
  // light theme
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme:
        const InputDecorationTheme(labelStyle: TextStyle(color: Colors.green)),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: backButtonArrow,
    ),
    iconTheme: const IconThemeData(color: lightGreen),
    buttonTheme: const ButtonThemeData(buttonColor: lightGreen),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
    checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(lightGreen),
        checkColor: MaterialStatePropertyAll(Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        selectedItemColor: lightGreen,
        elevation: 20, backgroundColor: Colors.white),
    searchBarTheme: SearchBarThemeData(
      backgroundColor:
          MaterialStatePropertyAll(backButtonArrow.withOpacity(0.1),),
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(color: backButtonArrow),
      ),
    ),
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white)),
      colorScheme: const ColorScheme.light(
        primary: bottomAppBarColorDark,
        secondary: deepGreen,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
          selectedItemColor: lightGreen,
          backgroundColor: bottomAppBarColorDark),
      iconTheme: const IconThemeData(color: lightGreen),
      buttonTheme: const ButtonThemeData(buttonColor: lightGreen),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      checkboxTheme: const CheckboxThemeData(
          fillColor: MaterialStatePropertyAll(lightGreen),
          checkColor: MaterialStatePropertyAll(Colors.white)),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(bottomAppBarColorDark),
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
      searchBarTheme: const SearchBarThemeData(
          backgroundColor: MaterialStatePropertyAll(bottomAppBarColorDark),
          hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey))));
}
