import 'package:flutter/material.dart';

import 'constants.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(31, 58, 131, .1),
  100: Color.fromRGBO(31, 58, 131, .2),
  200: Color.fromRGBO(31, 58, 131, .3),
  300: Color.fromRGBO(31, 58, 131, .4),
  400: Color.fromRGBO(31, 58, 131, .5),
  500: Color.fromRGBO(31, 58, 131, .6),
  600: Color.fromRGBO(31, 58, 131, .7),
  700: Color.fromRGBO(31, 58, 131, .8),
  800: Color.fromRGBO(31, 58, 131, .9),
  900: Color.fromRGBO(31, 58, 131, 1),
};

ThemeData theme() {
  return ThemeData(
    // primarySwatch: MaterialColor(0xFF1F3A83, color),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    buttonColor: Color(0xFF1F3A83),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          primary: Color(0xFF1F3A83),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: Size(307, 56)),
    ),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    titleSpacing: 20.0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Color(0XFF4A4B4D),
          fontSize: 24,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w800),
    ),
  );
}
