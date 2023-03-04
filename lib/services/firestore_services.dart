import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class FirestoreServices{

  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map <String , dynamic> data,
    }) async {

      final reference = _fireStore.doc(path);
      debugPrint('Request Data : $data ');
      await reference.set(data);

    }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint('Request Data : $path ');
    await reference.delete();

  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
          snapshot.data() as Map<String, dynamic>,
          snapshot.id,
        ),
      )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

}



