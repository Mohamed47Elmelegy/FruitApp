import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frutes_app/core/config/ansicolor.dart';
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
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    log(DebugConsoleMessages.info(
        'Path: $path, DocumentId: $documentId, Query: $query'));
    try {
      if (documentId != null) {
        var data = await firestore.collection(path).doc(documentId).get();
        log(DebugConsoleMessages.error(
            "Document Data: ${data.data()}")); // Print data to verify
        return data.data();
      } else {
        Query<Map<String, dynamic>> data = firestore.collection(path);
        if (query != null) {
          // Handle where clause
          if (query['where'] != null && query['isEqualTo'] != null) {
            data = data.where(query['where'], isEqualTo: query['isEqualTo']);
          }

          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var descending = query['descending'] ?? false;
            data = data.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'];
            data = data.limit(limit);
          }
        }
        var result = await data.get();
        log(DebugConsoleMessages.info(
            "Total documents found: ${result.docs.length}"));
        log(DebugConsoleMessages.success(
            "Query Data: ${result.docs.map((e) => e.data()).toList()}")); // Print data to verify
        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      log(DebugConsoleMessages.error('Error in getData: $e'));
      rethrow;
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> deleteData({
    required String path,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).delete();
  }

  @override
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).doc(documentId).update(data);
  }
}
