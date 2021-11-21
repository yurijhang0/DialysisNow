import 'package:flutter/material.dart';
import 'package:fryo/src/screens/Dashboard.dart';
//import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
//import './ProductPage.dart';
//import '../shared/Product.dart';
//import '../shared/partials.dart';

class ReportScreen extends StatefulWidget {
  final String pageTitle;

  ReportScreen({Key key, this.pageTitle}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
          textAlign: TextAlign.center),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Container(
                  width: 80,
                  height: 80,
                  child: FittedBox(
                    child: FloatingActionButton(
                      shape: CircleBorder(),
                      child: Icon(Icons.power_off),
                      onPressed: (){},
                    ),
                  )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        child: Icon(Icons.storm),
                        onPressed: (){},
                      ),
                    )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        child: Icon(Icons.water_damage),
                        onPressed: (){},
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    "Power Outage",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ),
                Center(
                    child: Text(
                      "Hurricane",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                ),
                Center(
                    child: Column(
                      children: <Widget> [
                        Text(
                          "Water",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Contamination",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        child: Icon(Icons.warning_amber),
                        onPressed: (){},
                      ),
                    )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        child: Icon(Icons.note),
                        onPressed: (){},
                      ),
                    )
                ),
              ]
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                    child: Text(
                      "Internal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                ),
                Center(
                    child: Text(
                      "Others",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                ),
              ],
            ),
            //Spacer(flex: 2),
            SizedBox(height: 20),
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:
                  const Text(
                    'CANCEL',
                    style: TextStyle(
                        backgroundColor: Colors.red,
                        color: Colors.white
                    ) ,
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
                TextButton(
                  onPressed: (){},
                  child:
                  const Text(
                    'REPORT',
                    style: TextStyle(
                        backgroundColor: Colors.green,
                        color: Colors.white
                    ) ,
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                )
              ],
            )

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





