import 'package:flutter/material.dart';

class ServerSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Column(
        children: <Widget>[
          Text("Server URL and Port"),
          Placeholder(),
        ],
      ),
    );
  }
}
