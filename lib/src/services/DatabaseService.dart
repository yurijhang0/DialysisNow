import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  //final String uid;
  DatabaseService();

  // collection reference
  final CollectionReference reportCollection = FirebaseFirestore.instance.collection('reports');

  Future updateUserData(bool powerOutage, bool hurricane, bool waterContamination, bool internal, bool other, String addInfo) async {
    return await reportCollection.doc().set({
      'powerOutage': powerOutage,
      'hurricane': hurricane,
      'waterContamination': waterContamination,
      'internal': internal,
      'other': other,
      'addInfo': addInfo,
    });
  }

  // get reports stream
  Stream<QuerySnapshot> get reports {
    return reportCollection.snapshots();
  }

}