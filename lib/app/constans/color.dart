import 'package:flutter/material.dart';

const appPurpleLight1 = Color(0xFF9345F2);
const appWhite = Color(0xFFFAF8FC);
const appPurple = Color(0xFF2E0D8A);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appPurpleDark = Color(0xFF1E0771);
const appOrange = Color(0xFFE6704A);

ThemeData ThemeLight = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appPurpleDark,
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: appPurple,
  appBarTheme: AppBarTheme(
    elevation: 4,
    backgroundColor: appPurple,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: appPurpleDark),
    bodyMedium: TextStyle(color: appPurpleDark),
  ),
  listTileTheme: ListTileThemeData(
    textColor: appPurpleDark,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: appPurpleDark,
    unselectedLabelColor: Colors.grey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appPurpleDark,
        ),
      ),
    ),
  ),
);

ThemeData ThemeDark = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appWhite,
  ),
  scaffoldBackgroundColor: appPurpleDark,
  primaryColor: appPurpleLight2,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: appPurpleDark,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: appWhite),
    bodyMedium: TextStyle(color: appWhite),
  ),
  listTileTheme: ListTileThemeData(
    textColor: appWhite,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: appWhite,
    unselectedLabelColor: Colors.grey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appWhite,
        ),
      ),
    ),
  ),
);
