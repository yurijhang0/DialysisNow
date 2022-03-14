import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'Fryo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MainInfoScreen()//, // just for testing
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
