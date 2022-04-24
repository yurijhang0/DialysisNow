import 'package:flutter/material.dart';
import 'package:fryo/src/models/user.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fryo/src/screens/wrapper.dart';
import 'package:fryo/src/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      )
      title: 'Fryo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
     //, // just for testing
      // routes: <String, WidgetBuilder> {
      //   '/signup': (BuildContext context) =>  SignUpPage(),
      //   '/signin': (BuildContext context) =>  SignInPage(),
      //   '/dashboard': (BuildContext context) => Dashboard(),
      //   '/productPage': (BuildContext context) => ProductPage(),
      // },
    );
  }
}
