import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: _topBar(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _report(),
            ]));
  }

//AppBar
  Widget _topBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        iconSize: 21,
        icon: Icon(Fryo.funnel),
      ),
      backgroundColor: primaryColor,
      title: Text('DialysisNow',
          style: logoWhiteStyle, textAlign: TextAlign.center),
    );
  }

  Widget _report() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "REPORT CLOSURE",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              //textAlign: TextAlign.center,
            ),
            _icons('Power Outage', Icons.power_off),
            _icons('Hurricane', Icons.storm),
            _icons('Water Contamination', Icons.water_damage),
            _icons('Internal', Icons.warning_amber),
            _icons('Otherss', Icons.construction),
            //Spacer(flex: 2),
            SizedBox(height: 50),
            Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              //textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter additional information',
              ),
            ),
            TextButton(
                onPressed: null,
                child: const Text('REPORT'),
                style: TextButton.styleFrom(backgroundColor: Colors.green))
          ],
        ));
  }

  Widget _enterInfo() {}

  Widget _icons(String title, IconData _icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(_icon),
          tooltip: 'choose issue',
          onPressed: () {
            setState(() {});
          },
        ),
        Text(title)
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}






// wrap the horizontal listview inside a sizedBox..





