import 'package:untitled1/models/user_data.dart';
import 'package:untitled1/services/firestore_services.dart';
import 'package:untitled1/utilities/api_path.dart';

import '../models/product.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();

  Future<void> setUserData(UserData userData);
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instance;

  FirestoreDatabase(this.uid);

  @override
  Stream<List<Product>> salesProductsStream() => _service.collectionsStream(
      path: 'products/',
      builder: (data, documentId) => Product.fromMap(data!, documentId),
      queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
      path: ApiPath.products(),
      builder: (data, documentId) => Product.fromMap(data!, documentId));
      
  @override
  Future<void> setUserData(UserData userData) async => await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );
      

}
