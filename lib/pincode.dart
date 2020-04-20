import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/painting.dart';
import 'package:local_auth/local_auth.dart';

class Pincode extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();

  // 2. created object of localauthentication class
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> _authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool _authenticated = false;
    try {
      _authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
    } catch (e) {
      print(e);
    }

    return _authenticated;
//    if (!mounted) return;
//    setState(() {
////      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
//    });
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
                if (_formKey.currentState.validate())
                  Navigator.of(context).pushNamed("/home");
                // Next screen
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
              onPressed: () {
                Navigator.of(context).pushNamed("/home");
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
