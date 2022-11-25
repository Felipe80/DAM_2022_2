import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> productos() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    int limite = 10;
    return FirebaseFirestore.instance.collection('productos').where('stock', isLessThan: limite).snapshots();
  }

  //agregar
  Future agregar(String codProducto, String nombre, int stock) {
    return FirebaseFirestore.instance.collection('productos').doc().set({
      'cod_producto': codProducto,
      'nombre': nombre,
      'stock': stock,
    });
  }

  //borrar
  Future borrar(String productoId) {
    return FirebaseFirestore.instance.collection('productos').doc(productoId).delete();
  }
}
