import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/DialysisInfoService.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fryo/src/shared/globals.dart' as globals;
import 'package:fryo/main.dart' as main;

import 'ReportScreen.dart';

class Resources extends StatefulWidget {
  final String pageTitle;
  final bool closureBool;  // bool for closure status
  final String placeID;

  // set variables to store main center information

  Resources({Key key, this.pageTitle, this.closureBool, this.placeID})
      : super(key: key);
  
  @override
  _ResourcesState createState() => _ResourcesState();

}

class _ResourcesState extends State<Resources> {

  @override
  Widget build(BuildContext context) {
    return infoTab(context);
  }

  Widget infoTab(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left:20, right:20),
        child: ListView(children: <Widget>[
          Image.asset('images/logo.png'),
          Text('Resources', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left),
          ResourceCard('Dial 911', "tel://911"),
          ResourceCard('Centers for Disease Control and Prevention (CDC)', 'https://blogs.cdc.gov/publichealthmatters/2020/03/dialysis/'),
          ResourceCard('National Kidney Foundation', 'https://www.kidney.org/atoz/content/disasterbrochurefacilities'),
          ResourceCard('Kidney Community Emergency Response', 'https://www.kcercoalition.com/en/resources/patient-resources/emergency-preparedness/'),
          ResourceCard('Health Services Advisory Group (HSAG)', 'https://www.hsag.com/contentassets/d36acb1c29c2420ea2162d60c2427e8b/allnw_dx-disaster-poster_508.pdf'),
          ResourceCard('DaVita', 'https://www.davita.com/education/ckd-life/emergency-preparedness-for-people-with-kidney-disease'),
          ResourceCard('Fresenius', 'https://www.freseniuskidneycare.com/treatment/disaster-preparation'),
          SizedBox(height: 20),
          Text('Disclaimer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left),
          SizedBox(height: 5),
          Text('Please note that DialysisNow in no way administers medical treatment or care. The information presented is, to our knowledge, up to date, accurate, and reliable. DialysisNow utilizes the Google API to assess a center’s information and availability– as such, this status is updated live whenever somebody searches for a center.',
              textAlign: TextAlign.justify),
          SizedBox(height: 5),
          Text('DialysisNow does not present patient information or history in any situation. We are not directly affiliated with any particular dialysis center, provider, etc.; as such, we do not have access to patient information. DialysisNow is HIPPA compliant– the information provided is information that is already publicly available to the general public.',textAlign: TextAlign.justify),
          SizedBox(height: 5),
          Text('DialysisNow will not share your information. Please note that when you input your data into the application, this data is not saved. Please also note that inputting a location is used solely for navigational purposes. DialysisNow is compliant with privacy policies.',textAlign: TextAlign.justify),
          SizedBox(height: 20),
          Text('About DialysisNow', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left),
          SizedBox(height: 5),
          Text('DialysisNow is a mobile application with its roots in dialysis treatment. Many people with declining kidney function rely on regular dialysis treatment– typically, those who require treatment need to go to a dialysis center at least 3 times a week. In severe cases, it can be as often as several times a day to receive treatment. Since dialysis centers are such critical places for those with chronic kidney disease, it is crucial for patients to be aware of which centers are immediately available to them. However, in times of crisis, such as during natural disasters, it can be very difficult for patients to assess whether or not a dialysis center is available or open. Furthermore, if a center’s information is out of date, it can make it even more difficult for patients to receive the care they need. As such, DialysisNow aims to circumvent these issues by combining these features into a singular product. We also wish to expand on the project by providing friendly UI elements, as well as other convenient features to enhance the user’s experience when using the application.',
          textAlign: TextAlign.justify),
          SizedBox(height: 20),
          Text('Meet our Team', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left),
          SizedBox(height: 5),
          Text('Ann McClellan (Project Client)'),
          Text('Alice Wang'),
          Text('Nathan Kim'),
          Text('Nelson Alexander'),
          Text('Yoo Ri Jhang'),
      ]),
    );
  }

  GestureDetector ResourceCard(String info, String link) {
    return GestureDetector(
        child: Container(
          height: 50,
          child: Card(
              color: Colors.green,
              child:
              Container(
                alignment: Alignment.center,
                child:Text(info, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center),
              )),
        ),
        onTap: () => launch(link));
  }
}