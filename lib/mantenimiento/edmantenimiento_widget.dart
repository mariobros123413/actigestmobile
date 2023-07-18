import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mantenimiento_model.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

import 'edmantenimiento_model.dart';

class EditarMantenimientoScreen extends StatefulWidget {
  final MantenimientoModel activo;

  EditarMantenimientoScreen({required this.activo});

  @override
  _EditarMantenimientoScreenState createState() =>
      _EditarMantenimientoScreenState();
}

class _EditarMantenimientoScreenState extends State<EditarMantenimientoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _editarActivoModel = EditarMantenimientoModel();

  @override
  void initState() {
    super.initState();

    // Inicializa los valores iniciales del formulario con los datos actuales del activo fijo
    _editarActivoModel.id = widget.activo.id;
    _editarActivoModel.idaf = widget.activo.idaf;
    _editarActivoModel.titulo = widget.activo.titulo;
    _editarActivoModel.descripcion = widget.activo.descripcion;
    _editarActivoModel.fechainicio = widget.activo.fechainicio;
    _editarActivoModel.responsable = widget.activo.responsable;
    _editarActivoModel.costo = widget.activo.costo;
    _editarActivoModel.idestado = widget.activo.idestado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Mantenimiento del Activo Fijo'),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  initialValue: _editarActivoModel.idaf.toString(),
                  decoration: InputDecoration(
                    labelText: 'ID Activo Fijo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un ID de algún Activo Fijo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editarActivoModel.idaf = int.parse(value!);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  initialValue: _editarActivoModel.titulo,
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un titulo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editarActivoModel.titulo = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  initialValue: _editarActivoModel.fechainicio != null
                      ? _editarActivoModel.fechainicio!
                          .toString()
                          .substring(0, 10)
                      : '',
                  decoration: InputDecoration(
                    labelText: 'Fecha Inicio',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa una fecha yyyy-mm-dd';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null && value.isNotEmpty) {
                      _editarActivoModel.fechainicio = DateTime.parse(value);
                    } else {
                      _editarActivoModel.fechainicio = null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  initialValue: _editarActivoModel.responsable,
                  decoration: InputDecoration(
                    labelText: 'Responsable a cargo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un lugar de compra';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editarActivoModel.responsable = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
                  initialValue: _editarActivoModel.idestado.toString(),
                  decoration: InputDecoration(
                    labelText: 'ID Estado',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un id del estado (1,2,3)';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editarActivoModel.idestado = int.parse(value!);
                  },
                ),
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
      int? idaf = _editarActivoModel.idaf;
      String? titulo = _editarActivoModel.titulo;

      String? descripcion = _editarActivoModel.descripcion;
      DateTime? dia = _editarActivoModel.fechainicio;
      String? responsable = _editarActivoModel.responsable;

      int? costo = _editarActivoModel.costo;
      int? idestado = _editarActivoModel.idestado;

      // Llamar a updateActivoData con los valores obtenidos
      updateActivoData(
          id, idaf, titulo, descripcion, dia, responsable, costo, idestado);
    }
  }

  Future<void> updateActivoData(
    int? id,
    int? idaf,
    String? titulo,
    String? descripcion,
    DateTime? dia,
    String? responsable,
    int? costo,
    int? idestado,
  ) async {
    final url = 'https://apisi2.up.railway.app/api/mant/$id';
    print(id);
    try {
      final body = {
        'idaf': idaf?.toString() ?? '', // Convertir a String
        'titulo': titulo,

        'descripcion': descripcion,
        'fechaInicio': dia != null ? DateFormat('yyyy-MM-dd').format(dia) : '',
        'responsable': responsable,

        'costo': costo?.toString() ?? '', // Convertir a String
        'idestado': idestado?.toString() ?? '' // Convertir a String
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
