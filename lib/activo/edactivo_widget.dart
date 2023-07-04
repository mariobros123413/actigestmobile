import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../vehicle/vehicle_model.dart';
import 'activo_model.dart';
export '../vehicle/vehicle_model.dart';

import 'dart:async';
import 'dart:convert';
// import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edactivo_model.dart';

class EditarActivoFijoScreen extends StatefulWidget {
  final ActivoModel activo;

  EditarActivoFijoScreen({required this.activo});

  @override
  _EditarActivoFijoScreenState createState() => _EditarActivoFijoScreenState();
}

class _EditarActivoFijoScreenState extends State<EditarActivoFijoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _editarActivoModel = EditarActivoModel();

  @override
  void initState() {
    super.initState();

    // Inicializa los valores iniciales del formulario con los datos actuales del activo fijo
    _editarActivoModel.id = widget.activo.id;
    _editarActivoModel.descripcion = widget.activo.descripcion;
    _editarActivoModel.dia = widget.activo.dia;
    _editarActivoModel.costo = widget.activo.costo;
    _editarActivoModel.lugar = widget.activo.lugar;
    _editarActivoModel.marca = widget.activo.marca;
    _editarActivoModel.modelo = widget.activo.modelo;
    _editarActivoModel.serial = widget.activo.serial;
    _editarActivoModel.foto = widget.activo.foto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Activo Fijo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _editarActivoModel.descripcion,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editarActivoModel.descripcion = value;
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.dia != null
                    ? _editarActivoModel.dia!.toString().substring(0, 10)
                    : '',
                decoration: InputDecoration(
                  labelText: 'Dia de Compra',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una fecha yyyy-mm-dd';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    _editarActivoModel.dia = DateTime.parse(value);
                  } else {
                    _editarActivoModel.dia = null;
                  }
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.costo.toString(),
                decoration: InputDecoration(
                  labelText: 'Costo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un costo entero';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editarActivoModel.costo = int.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.lugar,
                decoration: InputDecoration(
                  labelText: 'Lugar de Compra',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un lugar de compra';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editarActivoModel.lugar = value;
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.marca,
                decoration: InputDecoration(
                  labelText: 'Marca',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una marca';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editarActivoModel.marca = value;
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.modelo,
                decoration: InputDecoration(
                  labelText: 'Modelo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un modelo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editarActivoModel.modelo = value;
                },
              ),
              TextFormField(
                initialValue: _editarActivoModel.serial.toString(),
                decoration: InputDecoration(
                  labelText: 'Serial',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un Serial entero';
                  }
                  return null;
                },
                onSaved: (value) {
                  final serial = int.tryParse(value ?? '');
                  _editarActivoModel.serial = serial;
                },
              ),
              // Agrega aquí los demás TextFormField para los campos que deseas editar

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para guardar los cambios
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _guardarCambios();
                        // Aquí puedes realizar la lógica para guardar los cambios
                        // por ejemplo, puedes enviar una solicitud al servidor
                        // o actualizar la base de datos local

                        Navigator.of(context)
                            .pop(); // Volver a la pantalla anterior
                      }
                    },
                    child: Text('Guardar cambios'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para cancelar la edición y volver a la pantalla anterior
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _guardarCambios() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      // Obtener los valores de los campos
      int? id = _editarActivoModel.id;

      String? descripcion = _editarActivoModel.descripcion;
      DateTime? dia = _editarActivoModel.dia;
      int? costo = _editarActivoModel.costo;
      String? lugar = _editarActivoModel.lugar;
      String? marca = _editarActivoModel.marca;
      String? modelo = _editarActivoModel.modelo;
      int? serial = _editarActivoModel.serial;

      // Llamar a updateActivoData con los valores obtenidos
      updateActivoData(
          id, descripcion, dia, costo, lugar, marca, modelo, serial);
    }
  }

  Future<void> updateActivoData(
    int? id,
    String? descripcion,
    DateTime? dia,
    int? costo,
    String? lugar,
    String? marca,
    String? modelo,
    int? serial,
  ) async {
    final url = 'https://apisi2.up.railway.app/api/acti/$id';
    print(id);
    try {
      final body = {
        'descripcion': descripcion,
        'diaCompra': dia != null ? DateFormat('yyyy-MM-dd').format(dia!) : '',
        'costo': costo?.toString() ?? '', // Convertir a String
        'lugarCompra': lugar,
        'marca': marca,
        'modelo': modelo,
        'serial': serial?.toString() ?? '', // Convertir a String
        'foto': 'a'
      };
      print('Body de la solicitud: $body');

      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      if (response.statusCode == 200) {
        print('Datos del activo actualizados');
        // notifyListeners();
      } else {
        print('Error en la solicitud: ${response.statusCode} updateActivoData');
      }
    } catch (e) {
      print('Excepción durante la solicitud updateActivoData: $e');
    }
  }
}
