import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/models/MyUser.dart';
import 'package:fryo/src/screens/InfoScreen.dart';
import '../services/DatabaseService.dart';
import '../shared/colors.dart';
import 'package:fryo/src/services/DatabaseService.dart';
import 'package:provider/provider.dart';


class ReportScreen extends StatefulWidget {
  final String pageTitle;
  final String placeID;


  ReportScreen({Key key, this.pageTitle, this.placeID}) : super(key: key);

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

  get email => null;
  get password => null;

  @override
  void dispose() {
    // clean controller when widget disposed
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().reports,
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: _topBar(),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _report(),
              ])),
    );
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

    final FirebaseAuth auth = FirebaseAuth.instance;

    MyUser userFromFirebaseUser(User user) {
      if (user != null) {
        return MyUser(uid: user.uid);
      } else {
        return null;
      }
    }

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
                      backgroundColor: powerOutageBool ? Colors.green[300] : Colors.green[100],
                      child: Icon(Icons.power_off_outlined, color: Colors.black87),
                      onPressed: () {
                        setState(() => powerOutageBool = !powerOutageBool);
                        //powerOutageBool = true;
                        //UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
                        //User user = result.user;
                        //return userFromFirebaseUser(user);
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
                        backgroundColor: hurricaneBool ? Colors.green[300] : Colors.green[100],
                        child: Icon(Icons.storm, color: Colors.black87),
                        onPressed: (){
                          setState(() => hurricaneBool = !hurricaneBool);
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
                        backgroundColor: waterContaminationBool ? Colors.green[300] : Colors.green[100],
                        child: Icon(Icons.water_damage_outlined, color: Colors.black87),
                        onPressed: (){
                          setState(() => waterContaminationBool = !waterContaminationBool);
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
                        backgroundColor: internalBool ? Colors.green[300] : Colors.green[100],
                        child: Icon(Icons.warning_amber_outlined, color: Colors.black87),
                        onPressed: (){
                          setState(() => internalBool = !internalBool);
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
                        backgroundColor: otherBool ? Colors.green[300] : Colors.green[100],
                        child: Icon(Icons.note_outlined, color: Colors.black87),
                        onPressed: (){
                          setState(() => otherBool = !otherBool);
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
                  onPressed: () async {
                    additionalInfo = Text(textController.text);
                    // TEMPORARY CLOSURE REPORT!! WILL USE DATABASE LATER
                    bool closureBool = false;
                    if (powerOutageBool || hurricaneBool || waterContaminationBool ||internalBool || otherBool || additionalInfo.data != "") {
                      closureBool = true;
                    }
                    Navigator.pop(context);
                    return await DatabaseService().updateUserData(widget.placeID, powerOutageBool, hurricaneBool, waterContaminationBool, internalBool, otherBool, additionalInfo.data);
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(closureBool: closureBool)));
                    Navigator.pop(context);
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





