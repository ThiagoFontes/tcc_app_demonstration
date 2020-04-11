import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lockoon/core/consts.dart';
import 'package:lockoon/stores/server_selection_store.dart';
import 'package:lockoon/wigets/round_button_icon.dart';
import 'package:lockoon/wigets/round_flexible_textfield.dart';
import 'package:mobx/mobx.dart';

class ServerSelectionPage extends StatefulWidget {
  @override
  _ServerSelectionPageState createState() => _ServerSelectionPageState();
}

class _ServerSelectionPageState extends State<ServerSelectionPage> {
  final myController = TextEditingController();
  final ServerSelectionStore store = ServerSelectionStore();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();

    _disposers ??= [
      reaction(
        (_) => store.serverStatus,
        (int status) {
          if (status == STATUS_SUCCESS_RESPONSE) {
            Navigator.pushNamed(context, "/scan");
          }
          if (status == STATUS_ERROR_RESPONSE) {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("Something went wrong :c"),
                duration: Duration(seconds: 5),
              ),
            );
          }
        },
      )
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      height: 1.8,
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "First define the server you'll connect to.",
                style: TextStyle(
                  height: 1,
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: <Widget>[
                    RoundFlexibleTextField(
                      myController: myController,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Observer(builder: (_) {
                        if (store.serverStatus == STATUS_WAITING_RESPONSE) {
                          return SizedBox(
                            height: 56,
                            width: 56,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                          );
                        } else {
                          return RoundButtonIcon(
                            size: 56,
                            icon: Icons.arrow_forward,
                            click: () => store.ping(myController.text),
                          );
                        }
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}