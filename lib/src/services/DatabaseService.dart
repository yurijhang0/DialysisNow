import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fryo/src/models/report.dart';
import 'package:fryo/src/shared/globals.dart' as globals;

class DatabaseService with ChangeNotifier{

  //final String uid;
  DatabaseService() {
    getList();
  }

  // collection reference
  final CollectionReference reportCollection = FirebaseFirestore.instance.collection('reports');
  List<Map<String, dynamic>> reportList;
  StreamController<List<Map<String, dynamic>>> reportStream = StreamController<List<Map<String, dynamic>>>();

  updateUserData(String placeID, bool powerOutage, bool hurricane, bool waterContamination, bool internal, bool other, String addInfo) async {
    await reportCollection.doc().set({
      'placeID': placeID,
      'powerOutage': powerOutage,
      'hurricane': hurricane,
      'waterContamination': waterContamination,
      'internal': internal,
      'other': other,
      'addInfo': addInfo,
    });
    getList();
  }

  // reports list from snapshot
  List<Report> reportListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Report(
        placeID: doc.get('placeID') ?? " ",
        powerOutage: doc.get('powerOutage') ?? false,
        hurricane: doc.get('hurricane') ?? false,
        waterContamination: doc.get('waterContamination') ?? false,
        internal: doc.get('internal') ?? false,
        other: doc.get('other') ?? false,
        addInfo: doc.get('addInfo') ?? " ",
      );
    }).toList();
  }

   getList() async {
    final snapshot = await reportCollection.get();
    List<Map<String, dynamic>> list = [];
    for (var queryDocumentSnapshot in snapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      list.add(data);
    }
    //log(list.toString());
    globals.reportList = list;
    reportStream.add(list);
    notifyListeners();
  }


  // get reports stream
  Stream<List<Report>> get reports {
    return reportCollection.snapshots()
    .map(reportListFromSnapshot);
  }

}