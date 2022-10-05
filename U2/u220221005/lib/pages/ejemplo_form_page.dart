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
  String jornadaSeleccionada = 'd';
  bool estudiaGratuidad = true;
  String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

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
              campoJornada(),
              campoGratuidad(),
              botonFormulario(),
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
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoApellidos() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Apellidos',
      ),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique sus apellidos';
        }
        return null;
      },
    );
  }

  TextFormField campoEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Indique su email';
        }
        if (!RegExp(emailRegex).hasMatch(valor)) {
          return 'Formato de email no válido';
        }
        return null;
      },
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

  Column campoJornada() {
    return Column(
      children: [
        RadioListTile<String>(
          groupValue: jornadaSeleccionada,
          title: Text('Jornada Diurna'),
          value: 'd',
          onChanged: (jornada) {
            setState(() {
              jornadaSeleccionada = jornada!;
            });
          },
        ),
        RadioListTile<String>(
          groupValue: jornadaSeleccionada,
          title: Text('Jornada Vespertina'),
          value: 'v',
          onChanged: (jornada) {
            setState(() {
              jornadaSeleccionada = jornada!;
            });
          },
        ),
        RadioListTile<String>(
          groupValue: jornadaSeleccionada,
          title: Text('Jornada Ejecutiva'),
          value: 'e',
          onChanged: (jornada) {
            setState(() {
              jornadaSeleccionada = jornada!;
            });
          },
        ),
      ],
    );
  }

  SwitchListTile campoGratuidad() {
    return SwitchListTile(
      title: Text('Estudia con gratuidad'),
      value: estudiaGratuidad,
      onChanged: ((gratuidad) {
        setState(() {
          estudiaGratuidad = gratuidad;
        });
      }),
    );
  }

  Container botonFormulario() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Enviar'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            //form ok
          }
        },
      ),
    );
  }
}
