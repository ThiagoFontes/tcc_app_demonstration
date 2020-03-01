import 'package:flutter/material.dart';

class RoundButtonIcon extends StatelessWidget {
  final Function click;
  final double size;
  final IconData icon;
  final double iconSize;

  const RoundButtonIcon({
    Key key,
    @required this.click,
    this.size,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Theme.of(context).accentColor,
        width: size,
        height: size,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: click,
            child: Icon(
              icon,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
