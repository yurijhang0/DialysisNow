import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/screens/MapScreen.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/DialysisInfoService.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fryo/src/shared/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'DialysisNow',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyStatefulWidget(),//, // just for testing
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final mainInfo = new MainInfoScreen();
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = globals.widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialysisNow'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Fryo.search),
              title: Text(
                'Search',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.star),
              title: Text(
                'Main Center',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.alarm),
              title: Text(
                'Resources',
                style: tabLinkStyle,
              )),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
