import 'package:flutter/material.dart';

class RoundFlexibleTextField extends StatelessWidget {
  final String initialValue;
  const RoundFlexibleTextField({
    Key key, @required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          hintText: "Server URL and port",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
