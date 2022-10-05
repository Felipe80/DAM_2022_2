import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EjemploFormPage extends StatefulWidget {
  EjemploFormPage({Key? key}) : super(key: key);

  @override
  State<EjemploFormPage> createState() => _EjemploFormPageState();
}

class _EjemploFormPageState extends State<EjemploFormPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Form'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              campoNombres(),
              campoApellidos(),
              campoEmail(),
              campoHijos(),
              campoFechaNacimiento(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField campoNombres() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nombres',
        hintText: 'Escriba su primer y segundo nombre',
      ),
    );
  }

  TextFormField campoApellidos() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Apellidos',
      ),
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField campoHijos() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Cantidad Hijos',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Row campoFechaNacimiento() {
    return Row(
      children: [
        Text(
          'Fecha de Nacimiento: ',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          fFecha.format(fechaSeleccionada),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        IconButton(
          icon: Icon(MdiIcons.calendar),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1922),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                fechaSeleccionada = fecha ?? fechaSeleccionada;
              });
            });
          },
        ),
      ],
    );
  }
}
