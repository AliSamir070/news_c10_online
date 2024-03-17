import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff39A552),
        primary: Color(0xff39A552)
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff39A552),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 40
      )
    )
  );
}