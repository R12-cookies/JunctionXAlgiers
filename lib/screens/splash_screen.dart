import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/junctionx_algiers_white_oneline.png',
                  width: 200,
                )),
          ),
          Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/junction.png',
                  width: 250,
                )),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text("POWERED BY CELEC",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: _textFieldBackgroundColor)),
            ),
          )
        ],
      ),
    );
  }
}
