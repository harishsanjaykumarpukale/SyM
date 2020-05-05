import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'MyHome.dart';

class Pincode extends StatefulWidget {
  @override
  _PincodeState createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    print(listOfBiometrics);
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to view your transaction overview",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyHome(),
        ),
      );
    }
  }

  bool validatePin(String val) {
    if (val.contains("1234"))
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: new IconThemeData(color: Color(0xFF2B276D)),
        title: new Text(
          "EPRO",
          style: new TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: new Center(
        child: new ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              'Enter your PIN',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            new Divider(height: 5.0, color: Colors.black),
            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),
            new Theme(
                data: new ThemeData(
                  primaryColor: Colors.blue,
                  primaryColorDark: Colors.blue,
                ),
                child: new TextFormField(
                  key: _formKey,
                  obscureText: false,
                  decoration: new InputDecoration(
                    labelText: "PIN",
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Pincode cannot be empty";
                    } else {
                      if (val.contains('1234')) {
                        return "Success";
                      } else
                        return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                )),
            new Padding(
              padding: new EdgeInsets.all(40.0),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(15.0),
              color: Color(0xff2B276D),
              onPressed: () {
                print(_formKey.currentState.toString());
                Navigator.of(context).pushNamed("/home");
//                if (validatePin(_formKey.currentState.toString())) {
//                  Navigator.pushNamed(context, "/home");
//                }
              },
              child: Text("Submit",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            new ListTile(
              title: new Text(
                "OR",
                textAlign: TextAlign.center,
              ),
              enabled: false,
            ),
            Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(15.0),
              color: Color(0xff2B276D),
              onPressed: () async {
                if (await _isBiometricAvailable()) {
                  await _getListOfBiometricTypes();
                  await _authenticateUser();
                }
                // Next screen
              },
              child: Text("Choose to press your finger",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
            ),
            new Icon(
              Icons.fingerprint,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
