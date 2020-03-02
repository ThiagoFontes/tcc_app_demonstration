import 'package:flutter/material.dart';
import 'package:lockoon/pages/discover_bt.dart';
import 'package:lockoon/pages/server_selection.dart';
import 'package:lockoon/pages/unlock_screen.dart';

import 'core/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application. 0xFF0F0D17
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => ServerSelectionPage(),
        "/unlock": (context) => UnlockScreen(null),
        "/scan": (context) => DiscoveryPage(),
      },
    );
  }
}
