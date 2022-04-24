import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService( {this.uid});

  // collection reference
  final CollectionReference reportCollection = FirebaseFirestore.instance.collection('reports');

  Future updateUserData(String name, String center, bool type, String addInfo) async {
    return await reportCollection.document(uid).setData({
      'name': name,
      'center': center,
      'type': type,
      'addInfo': addInfo,
    });
  }

  // get reports stream
  Stream<QuerySnapshot> get reports {
    return reportCollection.snapshots();
  }

}