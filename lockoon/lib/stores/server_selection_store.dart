import 'dart:convert';

import 'package:lockoon/core/consts.dart';
import 'package:lockoon/models/device.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'server_selection_store.g.dart';

class ServerSelectionStore = _ServerSelectionStore with _$ServerSelectionStore;

abstract class _ServerSelectionStore with Store {
  @observable
  int serverStatus = STATUS_INITIAL;

  Device device;

  @action
  Future<void> ping(String serverIp) async {
    serverStatus = STATUS_WAITING_RESPONSE;
    try {
      final response =
          await http.get("http://" + serverIp + ":3000/api/system/ping");
      if (response.statusCode == 200) {
        serverStatus = STATUS_SUCCESS_RESPONSE;
      } else {
        serverStatus = STATUS_ERROR_RESPONSE;
      }
    } catch (SocketException) {
      serverStatus = STATUS_ERROR_RESPONSE;
    }
  }

  @action
  Future<void> requestDecryptionKey(String serverIp) async {
    serverStatus = STATUS_WAITING_RESPONSE;
    try {
      final response =
          await http.get("http://" + serverIp + ":3000/api/Device/iotDevice1");
      if (response.statusCode == 200) {
        serverStatus = STATUS_SUCCESS_RESPONSE;
        device = Device.fromJson(json.decode(response.body));
      } else {
        serverStatus = STATUS_ERROR_RESPONSE;
      }
    } catch (SocketException) {
      serverStatus = STATUS_ERROR_RESPONSE;
    }
  }
}
