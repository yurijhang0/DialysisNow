import 'package:flutter/material.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import '../shared/colors.dart';

class ReportScreen extends StatefulWidget {
  final String pageTitle;

  ReportScreen({Key key, this.pageTitle}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _selectedIndex = 0;
  // text controller for retrieving current value of TextField
  final textController = TextEditingController();
  // vars for reasoning of closure
  var powerOutageBool = false;
  var hurricaneBool = false;
  var waterContaminationBool = false;
  var internalBool = false;
  var otherBool = false;
  var additionalInfo = Text("");

  @override
  void dispose() {
    // clean controller when widget disposed
    textController.dispose();
    super.dispose();
  }

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
                color: Colors.black87,
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
                      backgroundColor: Colors.green[200],
                      child: Icon(Icons.power_off_outlined, color: Colors.black87),
                      onPressed: (){
                        powerOutageBool = true;
                      },
                    ),
                  )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: Colors.green[200],
                        child: Icon(Icons.storm, color: Colors.black87),
                        onPressed: (){
                          hurricaneBool = true;
                        },
                      ),
                    )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: Colors.green[200],
                        child: Icon(Icons.water_damage_outlined, color: Colors.black87),
                        onPressed: (){
                          waterContaminationBool = true;
                        },
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
                      color: Colors.black87,
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
                        color: Colors.black87,
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
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Contamination",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
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
                        backgroundColor: Colors.green[200],
                        child: Icon(Icons.warning_amber, color: Colors.black87),
                        onPressed: (){
                          internalBool = true;
                        },
                      ),
                    )
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        backgroundColor: Colors.green[200],
                        child: Icon(Icons.note, color: Colors.black87),
                        onPressed: (){
                          otherBool = true;
                        },
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
                        color: Colors.black87,
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
                        color: Colors.black87,
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
              controller: textController,
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
                  onPressed: (){
                    additionalInfo = Text(textController.text);
                    // TEMPORARY CLOSURE REPORT!! WILL USE DATABASE LATER
                    bool closureBool = false;
                    if (powerOutageBool || hurricaneBool || waterContaminationBool ||internalBool || otherBool || additionalInfo.data != "") {
                      closureBool = true;
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(closureBool: closureBool)));
                  },
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





