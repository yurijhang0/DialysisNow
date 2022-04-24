import 'package:flutter/material.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/screens/ReportScreen.dart';
import 'package:fryo/src/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return ReportScreen();
    }
  }
}