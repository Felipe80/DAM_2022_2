import 'package:ejemplo_firebase/services/firestore_service.dart';
import 'package:flutter/material.dart';

class ProductosAgregarPage extends StatefulWidget {
  ProductosAgregarPage({Key? key}) : super(key: key);

  @override
  State<ProductosAgregarPage> createState() => _ProductosAgregarPageState();
}

class _ProductosAgregarPageState extends State<ProductosAgregarPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: codigoCtrl,
                decoration: InputDecoration(
                  label: Text('Código'),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                  label: Text('Nombre'),
                ),
              ),
              TextFormField(
                controller: stockCtrl,
                decoration: InputDecoration(
                  label: Text('Stock'),
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  child: Text('Agregar Producto'),
                  onPressed: () {
                    int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;
                    FirestoreService().agregar(
                      codigoCtrl.text.trim(),
                      nombreCtrl.text.trim(),
                      stock,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
