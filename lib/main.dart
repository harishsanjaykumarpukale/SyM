import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pincode.dart';
import 'MyHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pincode(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => MyHome(),
      },
    );
  }
}
