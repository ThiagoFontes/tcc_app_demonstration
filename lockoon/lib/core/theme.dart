import 'package:flutter/material.dart';

ThemeData appTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      indicatorColor: Color(0xFF433E56),
      textSelectionHandleColor: Color(0xFF433E56),
      textSelectionColor: Color(0xFF6F94A8),
      cursorColor: Color(0xFF433E56),
      errorColor: Color(0xFFB0251B),
      accentColor: Color(0xFF4B33A2),
      primaryColor: Color(0xFF704581),
      primaryTextTheme: TextTheme(
        title: TextStyle(
          color: Color(0xFFE6E7F0),
        ),
      ),
      primaryIconTheme: IconThemeData(
        color: Color(0xFFE6E7F0),
      ),
      scaffoldBackgroundColor: Color(0xFFE6E7F0),
    );
  }