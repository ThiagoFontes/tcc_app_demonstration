import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothConnectionHandler {
  final BluetoothDevice server;
  BluetoothConnection connection;

  BluetoothConnectionHandler(this.server);

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  Future<void> connect() {
    return BluetoothConnection.toAddress(server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      isConnecting = false;
      isDisconnecting = false;

      return connection.input.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(data);
    // int index = buffer.indexOf(32);
    var base64String = base64.encode(data);

    if (dataString != "" && dataString != "\r\n") {
      final key = Key.fromUtf8("4To4jyTAOMvf99fx");
      final IV iv = IV.fromLength(16);

      final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: null));

      String decrypted;
      try {
        decrypted = encrypter.decrypt(Encrypted.from64(base64String), iv: iv);

        sendMessage(decrypted);

        print("Raw response: " + dataString);
        print("Base64 response: " + base64String);
        print("Decrypted message: " + decrypted);
      } catch (_) {
        sendMessage("Start");
      }
    }
  }

  void sendMessage(String text) async {
    text = text.trim();

    if (!isConnected) {
      await connect();
    }

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;
        print("Sent: " + text);
      } catch (e) {
        print("Error sending message");
      }
    }
  }
}
