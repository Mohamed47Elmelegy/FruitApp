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
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      var data = await firestore
          .collection(BackendPoint.getUser)
          .doc(documentId)
          .get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        var orderByField = query['orderBy'];
        var desending = query['desending'];
        if (orderByField != null) {
          data = data.orderBy(orderByField, descending: desending);
        }
      }
      if (query != null) {
        var limit = query['limit'];
        if (limit != null) {
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override

  /// Checks if a document exists in the specified Firestore collection.
  ///
  /// This method queries the Firestore collection at the given `path`
  /// and checks for the existence of a document with the specified `documentId`.
  ///
  /// Returns a [Future<bool>] indicating whether the document exists.
  ///
  /// [path] is the Firestore collection path.
  /// [documentId] is the ID of the document to check.

  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
