import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "EPRO",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          color: Color(0xFF2B276D),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        elevation: 1.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.account_box,
                size: 30,
              ),
              color: Color(0xFF2B276D),
              iconSize: 40.0,
              onPressed: () {
                Navigator.of(context).pushNamed("/myaccount");
              },
            ),
          )
        ],
      ),
      body: Center(
          child: new ListView(
        children: <Widget>[
          Container(
            height: 300,
            //padding: EdgeInsets.all(15.0),
            child: Card(
                elevation: 8,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Align(
                      child: new Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    ListTile(
                      title: Text("Upcoming Visit - 20/02/20"),
                      subtitle: Text(
                          "Your Next Visit is Scheduled on 20/02/20 time: hh:mm"),
                      isThreeLine: true,
                      leading: Icon(
                        Icons.place,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/visit");
                      },
                    ),
                    ListTile(
                      isThreeLine: true,
                      title: Text("Name of Hospital"),
                      subtitle: Text("Address of Hospital \n Visit Number - "),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.directions,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFF2B276D),
                      child: MaterialButton(
                        minWidth: 300, //MediaQuery.of(context).size.width,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                        child: Text("Reschedule",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: 300,
            //padding: EdgeInsets.all(15.0),
            child: Card(
                elevation: 8,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Prescription"),
                      subtitle: Text("Take <medicine> at <time>"),
                      leading: Icon(
                        Icons.note,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/prescription");
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )),
          ),
          Container(
            height: 300,
            //padding: EdgeInsets.all(15.0),
            child: Card(
                elevation: 8,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      child: new Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    ListTile(
                      title: Text("Questionnaire"),
                      subtitle: Text("You have a Questionnaire to answer"),
                      leading: Icon(
                        Icons.question_answer,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/questionnaire");
                      },
                    ),
                  ],
                )),
          ),
        ],
      )),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Coding Club"),
              decoration: new BoxDecoration(color: Color(0xFF2B276D)),
              accountEmail: new Text("abc@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Prescription History"),
              trailing: new Icon(
                Icons.note,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/prescription");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Visit History"),
              trailing: new Icon(
                Icons.place,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/vhistory");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Questionaire History"),
              trailing: new Icon(
                Icons.question_answer,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/questionnaire");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(
                Icons.arrow_right,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xFF2B276D),
                    size: 30,
                  ),
                  onPressed: null),
              new IconButton(
                  icon: Icon(
                    Icons.local_hospital,
                    color: Color(0xFF2B276D),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/visit");
                  }),
              new IconButton(
                  icon: Icon(
                    Icons.assignment,
                    color: Color(0xFF2B276D),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/prescription");
                  }),
              new IconButton(
                  icon: Icon(
                    Icons.question_answer,
                    color: Color(0xFF2B276D),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/questionnaire");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
