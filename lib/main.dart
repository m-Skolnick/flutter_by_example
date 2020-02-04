import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //   String _connectionStatus = 'Unknown';
  // final Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    GlobalClass();
    return Scaffold(
      appBar: AppBar(
        title: Text("Example app"),
      ),
      body: Center(
        child: Text("test text"),
      ),
    );
  }
}

class GlobalClass {
  // Singleton for global auth access
  static final GlobalClass _singleton = GlobalClass._internal();
  GlobalClass._internal();
  factory GlobalClass() => _singleton;
  static GlobalClass get shared => _singleton;

  var globalDataStream = StreamController<String>.broadcast();

  broadcast(String newString) {
    globalDataStream.sink.add(newString);
  }

  void dispose() {
    globalDataStream.close();
  }
}
