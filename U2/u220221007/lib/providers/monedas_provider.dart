import 'dart:convert';

import 'package:http/http.dart' as http;

class MonedasProvider {
  final apiURL = 'https://api.gael.cloud/general/public/monedas';

  Future<List<dynamic>> getMonedas() async {
    var respuesta = await http.get(Uri.parse(apiURL));

    //await Future.delayed(Duration(seconds: 3));

    print('Status Code:' + respuesta.statusCode.toString());

    if (respuesta.statusCode == 200) {
      //respuesta ok
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
