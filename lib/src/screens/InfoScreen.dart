import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/DialysisInfoService.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ReportScreen.dart';

class InfoScreen extends StatefulWidget {
  final String pageTitle;
  final bool closureBool;  // bool for closure status

  InfoScreen({Key key, this.pageTitle, this.closureBool}) : super(key: key);
  
  @override
  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {
  int _selectedIndex = 1;
  DialysisInfoService dialysisInfoService;
  final id = 'ChIJuc46ohEE9YgRyY2WKddJ4OY'; // place id EDIT FOR DEMO

  // get request fields
  AsyncSnapshot<DialysisInfo> snapshot2;

  @override
  Widget build(BuildContext context) {
    dialysisInfoService = new DialysisInfoService();
    return FutureBuilder<DialysisInfo>(
      future: dialysisInfoService.getDialysisCenterInfo(id),
      builder: (BuildContext context,
          AsyncSnapshot<DialysisInfo> snapshot) { // AsyncSnapshot<DialysisInfo>
        if (snapshot.connectionState ==
            ConnectionState.waiting) { // loading state -- create load screen
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot
              .hasError) { // failure for API request -- create error screen
            return Center(child: Text('Error: ${snapshot.error}'));
          } else { // got API request -- create main info screen
            snapshot2 = snapshot;
            // log(snapshot2.data.imageURL);
            return Scaffold(
                backgroundColor: bgColor,
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: primaryColor,
                  title:
                  Text('DialysisNow', textAlign: TextAlign.center),
                ),
                body: [Text('Search Feature Currently Unavailable'),
                  infoTab(context),
                  Text('Resources Feature Currently Unavailable'),
                ][_selectedIndex],
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
                ));
            return Center(child: new Text('${snapshot
                .data}')); // snapshot.data  :- get your object which is pass from your getDialysisCenterInfo() function
          }
        }
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget infoTab(BuildContext context) {
    return ListView(children: <Widget>[
      Image.network(
        'https://maps.googleapis.com/' +
            'maps/api/place/photo?maxwidth=400&photo_reference=' + snapshot2.data.imageRef +
            '&key=AIzaSyBZZvJlR5JkiBo_5mSKYvBFoxFg2noE1VA', height: 150, fit: BoxFit.fitWidth,),
      mainInfo(),
      headerTopCategories(context),
      report(),
      medicalInfo(),
    ]);
  }

  Widget sectionHeader(String headerTitle, {onViewMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(headerTitle, style: h4),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 2),
          child: FlatButton(
            onPressed: onViewMore,
            child: Text('View all ›', style: contrastText),
          ),
        )
      ],
    );
  }

// wrap the horizontal listview inside a sizedBox..
  Widget headerTopCategories(BuildContext context) {
    String formattedPhoneNum = formatPhoneNum();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              headerCategoryItem('Report', Fryo.pencil, onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportScreen()));
              }),
              headerCategoryItem('Call', Fryo.phone, onPressed: () =>
                  launch("tel://" + formattedPhoneNum)
              ),
              headerCategoryItem('Maps', Fryo.map,
                  onPressed: () => launch("https://www.google.com/maps/search/?api=1&query=" + snapshot2.data.name.replaceAll(" ", "+") + "&query_place_id=" + id)),
            ],
          ),
        )
      ],
    );
  }

  Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 86,
              height: 86,
              child: FloatingActionButton(
                shape: CircleBorder(),
                heroTag: name,
                onPressed: onPressed,
                backgroundColor: Colors.green[100],
                child: Icon(icon, size: 35, color: Colors.black87),
              )),
          Text(name + ' ›', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20))
        ],
      ),
    );
  }

  Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          sectionHeader(dealTitle, onViewMore: onViewMore),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: (items != null)
                  ? items
                  : <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('No items available at this moment.',
                      style: taglineText),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget mainInfo() {
    return Flexible(child:
    Container(
        color: primaryColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 10
                  ),
                  // Container(         // THIS IS FOR THE LOGO IMAGE!!!!
                  //     width: 100.0,
                  //     height: 100.0,
                  //     decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(
                  //             fit: BoxFit.fill,
                  //             image: new NetworkImage(
                  //                 "https://www.smileamilepainting.com/wp-content/uploads/2018/12/Davita-Care-Clinic-1024x614.jpg")
                  //         )
                  //     )
                  // ),
                  SizedBox(
                      width: 10
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot2.data.name, style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                      ]
                  )
                ],
              ),
              SizedBox(
                  height: 10
              ),
            ])
    ));
  }

  Widget medicalInfo() {
    bool currClosureBool = widget.closureBool ?? false;
    return Container(
        padding: new EdgeInsets.all(20.0),
        color: bgColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Location:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(snapshot2.data.address,
                  style: TextStyle(fontSize: 15)),
              SizedBox(
                  height: 15
              ),
              Text("Phone:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(snapshot2.data.phoneNum, style: TextStyle(fontSize: 15)),
              SizedBox(
                  height: 15
              ),
              Text("Center Status:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              (snapshot2.data.status && !currClosureBool ? Text("OPEN", style: TextStyle(fontSize: 15)) : Text("CLOSED", style: TextStyle(fontSize: 15))),
              SizedBox(
                  height: 15
              ),
              Text("Hours:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot2.data.openingHours[0],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[1],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[2],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[3],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[4],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[5],
                      style: TextStyle(fontSize: 15)),
                  Text(snapshot2.data.openingHours[6],
                      style: TextStyle(fontSize: 15)),
                ],
              ),
            ]
        )
    );
  }

  Widget report() {
    bool currClosureBool = widget.closureBool ?? false;
    if (currClosureBool) {
      return Container(
        padding: new EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
                children: <Widget>[new Text("WARNING:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,),
                  new Text("CENTER MAY BE CLOSED",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,),
                  new Text("ACCORDING TO USER REPORTS",
                    // FIX THIS LATER TO INCLUDE REASON
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,)
                ])),
      );
    } else {
      return Container();
    }
  }

  String formatPhoneNum() {
    String phoneNum = snapshot2.data.phoneNum;
    return phoneNum.replaceAll(" ", "").replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("-", "");
  }

}


