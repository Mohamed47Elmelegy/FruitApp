import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frutes_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    firestore.collection(path).add(data);
  }
}
