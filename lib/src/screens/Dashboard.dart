import 'package:flutter/material.dart';
import 'package:fryo/src/services/DialysisInfoService.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ReportScreen.dart';
import 'package:fryo/src/services/DialysisInfo.dart';


class Dashboard extends StatefulWidget {
  final String pageTitle;
  final id = 'ChIJuc46ohEE9YgRyY2WKddJ4OY'; // test dialysis center id

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 1;
  final String searchId = "ChIJuc46ohEE9YgRyY2WKddJ4OY";
  Future<DialysisInfo> futureDialysisInfo;
  DialysisInfoService dialysisInfoService;
  String name;
  String address;
  String phoneNum;
  String openingHours;

  @override
  void initState() {
    super.initState();
    print('Hello');
    dialysisInfoService = new DialysisInfoService();
    futureDialysisInfo = dialysisInfoService.getDialysisCenterInfo(searchId);
    futureDialysisInfo.then((value) {
      name = value.name;
      address = value.address;
      phoneNum = value.phoneNum;
      openingHours = value.openingHours;
    }, onError: (e) {
      print(e);
    });
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Text('Search Feature Currently Unavailable'),
      infoTab(context),
      Text('Resources Feature Currently Unavailable'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title:
          Text('DialysisNow', textAlign: TextAlign.center),
        ),
        body: _tabs[_selectedIndex],
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
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget infoTab(BuildContext context) {
  return ListView(children: <Widget>[
    Image.asset("images/CenterBuilding.jpeg", height: 150, fit: BoxFit.fitWidth,),
    mainInfo(),
    headerTopCategories(context),
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 10),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Report', Fryo.pencil, onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen()));
            }),
            headerCategoryItem('Call', Fryo.phone, onPressed: () =>
              launch("tel://8665446741")
            ),
            headerCategoryItem('Navigate', Fryo.map, onPressed: () => launch("http://flutter.dev")),
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
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
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
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://www.smileamilepainting.com/wp-content/uploads/2018/12/Davita-Care-Clinic-1024x614.jpg")
                        )
                    )
                ),
                SizedBox(
                    width: 10
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Davita Southwest Atlanta", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text("Dialysis Center", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                    ]
                )
              ],
            ),
            SizedBox(
                height: 10
            ),])
  ));
}

Widget medicalInfo() {
  return Container(
      padding: new EdgeInsets.all(20.0),
      color: bgColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Location:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text("3620 M.L.K. Jr Dr SW, Atlanta, GA 30331", style: TextStyle(fontSize: 15)),
            SizedBox(
                height: 15
            ),
            Text("Phone:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text("(866) 544-6741", style: TextStyle(fontSize: 15)),
            SizedBox(
                height: 15
            ),
            Text("Center Status:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text("OPEN", style: TextStyle(fontSize: 15)),
            SizedBox(
                height: 15
            ),
            Text("Hours:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Monday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 41
                ),
                Text("5AM - 10PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Tuesday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 38
                ),
                Text("5AM - 4PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Wednesday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 15
                ),
                Text("5AM - 10PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Thursday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 31
                ),
                Text("5AM - 4PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Friday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 53
                ),
                Text("5AM - 10PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Saturday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 33
                ),
                Text("5AM - 4PM", style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Sunday:", style: TextStyle(fontSize: 15)),
                SizedBox(
                    width: 43
                ),
                Text("CLOSED", style: TextStyle(fontSize: 15))
              ],
            )

          ]
      )
  );
}

Widget report() {
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
              new Text("DUE TO INTERNAL REASONS",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,)
            ])),
  );
}
