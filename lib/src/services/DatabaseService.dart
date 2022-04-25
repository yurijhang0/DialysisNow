import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fryo/src/models/report.dart';

class DatabaseService {

  //final String uid;
  DatabaseService();

  // collection reference
  final CollectionReference reportCollection = FirebaseFirestore.instance.collection('reports');

  Future updateUserData(String placeID, bool powerOutage, bool hurricane, bool waterContamination, bool internal, bool other, String addInfo) async {
    return await reportCollection.doc().set({
      'placeID': placeID,
      'powerOutage': powerOutage,
      'hurricane': hurricane,
      'waterContamination': waterContamination,
      'internal': internal,
      'other': other,
      'addInfo': addInfo,
    });
  }

  // reports list from snapshot
  List<Report> reportListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Report(
        powerOutage: doc.get('powerOutage') ?? false,
        hurricane: doc.get('hurricane') ?? false,
        waterContamination: doc.get('waterContamination') ?? false,
        internal: doc.get('internal') ?? false,
        other: doc.get('other') ?? false,
        addInfo: doc.get('addInfo') ?? " ",
      );
    }).toList();
  }

  // get reports stream
  Stream<List<Report>> get reports {
    return reportCollection.snapshots()
    .map(reportListFromSnapshot);
  }

}