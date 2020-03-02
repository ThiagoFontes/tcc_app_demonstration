import 'package:flutter/material.dart';
import 'package:lockoon/core/consts.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'server_selection_store.g.dart';

class ServerSelectionStore = _ServerSelectionStore with _$ServerSelectionStore;

abstract class _ServerSelectionStore with Store {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<ReactionDisposer> _disposers;

  @observable
  int serverStatus = STATUS_INITIAL;

  @action
  Future<void> requestDecryptionKey(String serverIp) async {
    serverStatus = STATUS_WAITING_RESPONSE;
    try {
      final response = await http.get("http://" + serverIp + ":3000");
      if (response.statusCode == 200) {
        serverStatus = STATUS_SUCCESS_RESPONSE;
      } else {
        serverStatus = STATUS_ERROR_RESPONSE;
      }
    } catch (SocketException) {
      serverStatus = STATUS_ERROR_RESPONSE;
    }
  }
}
