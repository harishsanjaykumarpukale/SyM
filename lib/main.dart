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

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:local_auth/local_auth.dart';
//import 'pincode.dart';
//import 'MyHome.dart';
//import 'dart:async';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  final LocalAuthentication _localAuthentication = LocalAuthentication();
//
//  Future<bool> _isBiometricAvailable() async {
//    bool isAvailable = false;
//    try {
//      isAvailable = await _localAuthentication.canCheckBiometrics;
//    } on PlatformException catch (e) {
//      print(e);
//    }
//
//    if (!mounted) return isAvailable;
//
//    isAvailable
//        ? print('Biometric is available!')
//        : print('Biometric is unavailable.');
//
//    return isAvailable;
//  }
//
//  Future<void> _getListOfBiometricTypes() async {
//    List<BiometricType> listOfBiometrics;
//    try {
//      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
//    } on PlatformException catch (e) {
//      print(e);
//    }
//
//    if (!mounted) return;
//
//    print(listOfBiometrics);
//  }
//
//  Future<void> _authenticateUser() async {
//    bool isAuthenticated = false;
//    try {
//      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
//        localizedReason:
//            "Please authenticate to view your transaction overview",
//        useErrorDialogs: true,
//        stickyAuth: true,
//      );
//    } on PlatformException catch (e) {
//      print(e);
//    }
//
//    if (!mounted) return;
//
//    isAuthenticated
//        ? print('User is authenticated!')
//        : print('User is not authenticated.');
//
//    if (isAuthenticated) {
//      Navigator.of(context).push(
//        MaterialPageRoute(
//          builder: (context) => MyHome(),
//        ),
//      );
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        body: Center(
//          child: RaisedButton(
//            child: Text("Go to app"),
//            elevation: 8.0,
//            onPressed: () async {
//              if (await _isBiometricAvailable()) {
//                await _getListOfBiometricTypes();
//                await _authenticateUser();
//              } else {
//                // pin page
//              }
//            },
//          ),
//        ),
//      ),
//      routes: <String, WidgetBuilder>{
//        "/home": (BuildContext context) => MyHome(),
//      },
//    );
//  }
//}
