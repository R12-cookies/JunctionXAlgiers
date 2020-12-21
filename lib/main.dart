import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/splash_screen.dart';
import 'screens/home_page.dart';
import 'util/state_widget.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  StateWidget stateWidget = new StateWidget(
    child: new MyApp(),
  );
  runApp(stateWidget);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
          return Text('smth');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(home: SplashScreen());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
          
        });
  }
}
