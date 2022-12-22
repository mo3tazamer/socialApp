import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'jannah',
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'jannah',
      )),
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 15,
  ),
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black, size: 28),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.black,
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    elevation: 3,
    shadowColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontFamily: 'jannah',
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'jannah',
      )),
  fontFamily: 'jannah',
);

ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: Colors.grey,
      elevation: 15,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.white54,
      backgroundColor: Colors.grey,
      elevation: 15,
    ),
    scaffoldBackgroundColor: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white, size: 28),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Colors.grey,
      elevation: 8,
      shadowColor: Colors.blueGrey,
    ),
    primarySwatch: Colors.teal,
    navigationBarTheme: NavigationBarThemeData(indicatorColor: Colors.white),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 18),
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 14,
        )),
    fontFamily: 'jannah');
