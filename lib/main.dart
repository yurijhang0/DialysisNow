import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'Fryo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MapScreen()//, // just for testing
        // routes: <String, WidgetBuilder> {
        //   '/signup': (BuildContext context) =>  SignUpPage(),
        //   '/signin': (BuildContext context) =>  SignInPage(),
        //   '/dashboard': (BuildContext context) => Dashboard(),
        //   '/productPage': (BuildContext context) => ProductPage(),
        // },
      )
    );
  }
}
