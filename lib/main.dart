import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Example Global Variable"),
        ),
        body: SomePage(),
      ),
    );
  }
}

class SomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Here is where your page context is stored in the global class.
    GlobalClass.shared.context = context;
    return Center(
      child: RaisedButton(
        child: Text("Show a Toast"),
        onPressed: () {
          _showToast();
        },
      ),
    );
  }
}

_showToast() {
  Scaffold.of(GlobalClass.shared.context).showSnackBar(SnackBar(
    content: Text("Here is your toast"),
  ));
}

class GlobalClass {
  // Singleton for global MaterialApp context access
  static final GlobalClass _singleton = GlobalClass._internal();
  GlobalClass._internal();
  factory GlobalClass() => _singleton;
  static GlobalClass get shared => _singleton;

  BuildContext context;
}
