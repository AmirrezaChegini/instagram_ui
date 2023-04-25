import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/constants.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Constants.white,
    primaryColorDark: Constants.pink,
    primaryColorLight: Constants.darkGrey,
    highlightColor: Constants.black,
    scaffoldBackgroundColor: Constants.white,
    colorScheme: ColorScheme.light(
      background: Constants.grey.withOpacity(0.2),
    ),
    cardColor: Constants.white,
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Constants.black,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      bodyLarge: TextStyle(
        color: Constants.black,
        fontSize: 16,
        fontFamily: 'GB',
      ),
      bodyMedium: TextStyle(
        color: Constants.black,
        fontSize: 12,
        fontFamily: 'GB',
      ),
      bodySmall: TextStyle(
        color: Constants.darkGrey,
        fontSize: 12,
        fontFamily: 'GM',
      ),
      titleLarge:
          TextStyle(color: Constants.black, fontSize: 14, fontFamily: 'GB'),
      titleMedium:
          TextStyle(color: Constants.black, fontSize: 10, fontFamily: 'GM'),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Constants.pink,
        foregroundColor: Constants.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'GB',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Constants.black,
        fontSize: 24,
        fontFamily: 'GB',
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'GB',
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.black,
        textStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'GB',
        ),
        side: const BorderSide(
          width: 2,
          color: Constants.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Constants.purple,
    primaryColorDark: Constants.green,
    primaryColorLight: Constants.grey,
    highlightColor: Constants.white,
    scaffoldBackgroundColor: Constants.purple,
    colorScheme: const ColorScheme.light(
      background: Constants.purpleLight,
    ),
    cardColor: Constants.purpleLight,
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Constants.white,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      bodyLarge: TextStyle(
        color: Constants.white,
        fontSize: 16,
        fontFamily: 'GB',
      ),
      bodyMedium: TextStyle(
        color: Constants.white,
        fontSize: 12,
        fontFamily: 'GB',
      ),
      bodySmall: TextStyle(
        color: Constants.grey,
        fontSize: 12,
        fontFamily: 'GM',
      ),
      titleLarge:
          TextStyle(color: Constants.white, fontSize: 14, fontFamily: 'GB'),
      titleMedium:
          TextStyle(color: Constants.white, fontSize: 10, fontFamily: 'GM'),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Constants.green,
        foregroundColor: Constants.white,
        textStyle: const TextStyle(
          color: Constants.white,
          fontSize: 16,
          fontFamily: 'GB',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.purpleLight,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Constants.white,
        fontSize: 24,
        fontFamily: 'GB',
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'GB',
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.grey,
        textStyle: const TextStyle(
          fontSize: 12,
          fontFamily: 'GB',
        ),
        side: const BorderSide(
          width: 2,
          color: Constants.grey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );
}
