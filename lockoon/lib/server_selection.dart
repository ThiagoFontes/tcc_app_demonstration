import 'package:flutter/material.dart';
import 'package:lockoon/wigets/round_button_icon.dart';
import 'package:lockoon/wigets/round_flexible_textfield.dart';

class ServerSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do you need a name?"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  RoundFlexibleTextField(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: RoundButtonIcon(
                      click: () => arrowButtonClick(context),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void arrowButtonClick(context) => Navigator.pushNamed(context, "/unlock");
}
