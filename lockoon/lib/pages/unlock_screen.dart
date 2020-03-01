import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lockoon/bluetooth/bluetooth_connection.dart';
import 'package:lockoon/wigets/round_button_icon.dart';

class UnlockScreen extends StatelessWidget {
  final BluetoothDevice device;

  UnlockScreen(this.device);

  @override
  Widget build(BuildContext context) {
    final UnlockScreen deviceArg = ModalRoute.of(context).settings.arguments;
    final BluetoothConnectionHandler connectionHandler =
        BluetoothConnectionHandler(deviceArg.device);
    connectionHandler.connect();
    return Scaffold(
      //backgroundColor: Color.fromRGBO(222, 222, 225, 1),
      appBar: AppBar(
        title: Text(deviceArg.device.name),
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
          RoundButtonIcon(
            click: () => connectionHandler.sendMessage("Start"),
            size: 180,
            icon: Icons.lock_outline,
            iconSize: 80,
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
