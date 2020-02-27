import 'package:flutter/material.dart';
import 'package:lockoon/server_selection.dart';
import 'package:lockoon/unlock_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application. 0xFF0F0D17
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => ServerSelection(),
        "/unlock": (context) => UnlockScreen(),
      },
    );
  }
}
