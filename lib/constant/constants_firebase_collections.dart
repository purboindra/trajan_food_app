import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionConstants {
  static CollectionReference getUserCollection() {
    return FirebaseFirestore.instance.collection('users');
  }

  static CollectionReference getProductCollection() {
    return FirebaseFirestore.instance.collection("products");
  }

  static CollectionReference getOrdersCollection() {
    return FirebaseFirestore.instance.collection("orders");
  }
}
