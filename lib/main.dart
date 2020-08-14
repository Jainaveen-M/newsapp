import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import './Entertainment.dart';
import './Health.dart';
import './Science.dart';
import './Sports.dart';
import './Technology.dart';
import './Business.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.amber,
    ),
    home: splashScreen(),
  ));
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyApp(),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,

    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Views(),
      ),
    );
  }
}

class Views extends StatefulWidget {
  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,20,0,0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.grey[200],
                Colors.lightBlue[100],
              ])),
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[

          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width *0.2,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.lightBlue[600],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'BUSINESS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 100.0,
                  )
                ],
              ),
              //color: Colors.amberAccent,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Business(),
                  ));
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Technology(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.red[600],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'TECHNOLOGY',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.computer,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Science(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.green[600],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'SCIENCE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.wb_incandescent,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Health(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.pink[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'HEALTH',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Entertainment(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.deepOrange[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'ENTERTAINMENT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.movie_filter,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sports(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey[700],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.0,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'SPORTS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white
                    ),
                  ),
                  Icon(
                    Icons.directions_bike,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
