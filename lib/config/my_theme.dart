import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/constants.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Constants.white,
    primaryColorDark: Constants.pink,
    primaryColorLight: Constants.darkGrey,
    highlightColor: Constants.black,
    scaffoldBackgroundColor: Constants.white,
    backgroundColor: Constants.grey.withOpacity(0.2),
    cardColor: Constants.white,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Constants.black,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      headline1: TextStyle(
        color: Constants.black,
        fontSize: 16,
        fontFamily: 'GB',
      ),
      headline2: TextStyle(
        color: Constants.black,
        fontSize: 12,
        fontFamily: 'GB',
      ),
      headline3: TextStyle(
        color: Constants.darkGrey,
        fontSize: 12,
        fontFamily: 'GM',
      ),
      headline4: TextStyle(
        color: Constants.black,
        fontSize: 14,
        fontFamily: 'GB'
      ),
      headline5: TextStyle(
        color: Constants.black,
        fontSize: 10,
        fontFamily: 'GM'
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Constants.pink,
        foregroundColor: Constants.white,
        textStyle: TextStyle(
          fontSize: 16,
          fontFamily: 'GB',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Constants.black,
        fontSize: 24,
        fontFamily: 'GB',
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'GB',
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.black,
        textStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'GB',
        ),
        side: BorderSide(
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
    backgroundColor: Constants.purpleLight,
    cardColor: Constants.purpleLight,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Constants.white,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      headline1: TextStyle(
        color: Constants.white,
        fontSize: 16,
        fontFamily: 'GB',
      ),
      headline2: TextStyle(
        color: Constants.white,
        fontSize: 12,
        fontFamily: 'GB',
      ),
      headline3: TextStyle(
        color: Constants.grey,
        fontSize: 12,
        fontFamily: 'GM',
      ),
      headline4: TextStyle(
        color: Constants.white,
        fontSize: 14,
        fontFamily: 'GB'
      ),
      headline5: TextStyle(
        color: Constants.white,
        fontSize: 10,
        fontFamily: 'GM'
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Constants.green,
        foregroundColor: Constants.white,
        textStyle: TextStyle(
          color: Constants.white,
          fontSize: 16,
          fontFamily: 'GB',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.purpleLight,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Constants.white,
        fontSize: 24,
        fontFamily: 'GB',
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'GB',
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.grey,
        textStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'GB',
        ),
        side: BorderSide(
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
