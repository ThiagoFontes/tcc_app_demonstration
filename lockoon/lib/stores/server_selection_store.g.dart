// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_selection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServerSelection on _ServerSelection, Store {
  final _$serverStatusAtom = Atom(name: '_ServerSelection.serverStatus');

  @override
  int get serverStatus {
    _$serverStatusAtom.context.enforceReadPolicy(_$serverStatusAtom);
    _$serverStatusAtom.reportObserved();
    return super.serverStatus;
  }

  @override
  set serverStatus(int value) {
    _$serverStatusAtom.context.conditionallyRunInAction(() {
      super.serverStatus = value;
      _$serverStatusAtom.reportChanged();
    }, _$serverStatusAtom, name: '${_$serverStatusAtom.name}_set');
  }

  final _$requestDecryptionKeyAsyncAction = AsyncAction('requestDecryptionKey');

  @override
  Future<void> requestDecryptionKey() {
    return _$requestDecryptionKeyAsyncAction
        .run(() => super.requestDecryptionKey());
  }

  @override
  String toString() {
    final string = 'serverStatus: ${serverStatus.toString()}';
    return '{$string}';
  }
}
