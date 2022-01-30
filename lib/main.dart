import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: InfoScreen()//, // just for testing
      // routes: <String, WidgetBuilder> {
      //   '/signup': (BuildContext context) =>  SignUpPage(),
      //   '/signin': (BuildContext context) =>  SignInPage(),
      //   '/dashboard': (BuildContext context) => Dashboard(),
      //   '/productPage': (BuildContext context) => ProductPage(),
      // },
    );
  }
}
