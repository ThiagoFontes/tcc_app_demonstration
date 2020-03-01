import 'package:mobx/mobx.dart';
part 'server_selection_store.g.dart';

class ServerSelection = _ServerSelection with _$ServerSelection;

abstract class _ServerSelection with Store {
  String serverIp;

  @observable
  int serverStatus;

  @action
  Future<void> requestDecryptionKey() async {

  }
}
