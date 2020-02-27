import 'package:flutter/material.dart';

class RoundFlexibleTextField extends StatelessWidget {
  const RoundFlexibleTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: TextField(
        decoration: new InputDecoration(
          hintText: "Server URL and port",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
        ),
      ),
    );
  }
}