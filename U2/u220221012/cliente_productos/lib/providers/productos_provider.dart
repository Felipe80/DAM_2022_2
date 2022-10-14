import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getProductos() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/productos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(
      String cod_producto, String nombre, int precio, int stock) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/productos'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_producto': cod_producto,
        'nombre': nombre,
        'precio': precio,
        'stock': stock,
      }),
    );

    return json.decode(respuesta.body);
  }
}
