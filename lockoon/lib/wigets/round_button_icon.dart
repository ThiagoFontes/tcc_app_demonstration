import 'package:flutter/material.dart';

class RoundButtonIcon extends StatelessWidget {
  final Function click;

  const RoundButtonIcon({
    Key key,
    @required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Theme.of(context).accentColor,
        width: 56,
        height: 56,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: click,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
