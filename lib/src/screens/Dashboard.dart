import 'dart:io';

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
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Text('Search Feature Currently Unavailable'),
      storeTab(context),
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

Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    Image.asset("images/CenterBuilding.jpeg", height: 150, fit: BoxFit.fitWidth,),
    mainInfo(),
    headerTopCategories(),
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
Widget headerTopCategories() {
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
            headerCategoryItem('Report', Fryo.pencil, onPressed: () {}),
            headerCategoryItem('Call', Fryo.phone, onPressed: () {}),
            headerCategoryItem('Navigate', Fryo.map, onPressed: () {}),
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
