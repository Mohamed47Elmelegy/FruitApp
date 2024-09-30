import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frutes_app/core/constants/backend_point.dart';
import 'package:frutes_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var data = await firestore
        .collection(BackendPoint.getDataFromUsersCollection)
        .doc(documentId)
        .get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
