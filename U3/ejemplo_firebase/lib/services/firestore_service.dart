import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> productos() {
    return FirebaseFirestore.instance.collection('productos').snapshots();
  }
}
