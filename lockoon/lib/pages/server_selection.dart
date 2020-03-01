import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lockoon/wigets/round_button_icon.dart';
import 'package:lockoon/wigets/round_flexible_textfield.dart';

class ServerSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,10),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      height: 1.8,
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "First define the server you'll connect to.",
                style: TextStyle(
                  height: 1,
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: <Widget>[
                    RoundFlexibleTextField(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: RoundButtonIcon(
                        size: 56,
                        icon: Icons.arrow_forward,
                        click: () => arrowButtonClick(context),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void arrowButtonClick(context) => Navigator.pushNamed(context, "/scan");
}
