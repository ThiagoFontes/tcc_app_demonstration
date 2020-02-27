import 'package:flutter/material.dart';

class UnlockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(222, 222, 225, 1),
      appBar: AppBar(
        title: Text("Unlock your door"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Switch(
                value: true,
                onChanged: (bool value) {},
              ),
            ],
          ),
          ClipOval(
            child: Container(
              width: 140,
              height: 140,
              child: Icon(
                Icons.vpn_key,
                size: 50,
                color: Colors.white,
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Output:\nInput:"),
          ),
        ],
      ),
    );
  }
}
