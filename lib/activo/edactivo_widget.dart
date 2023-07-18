import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'activo_model.dart';

import 'dart:async';

// import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'edactivo_model.dart';

import 'package:dio/dio.dart';

import 'package:intl/intl.dart';

class EditarActivoFijoScreen extends StatefulWidget {
  final ActivoModel activo;

  EditarActivoFijoScreen({required this.activo});

  @override
  _EditarActivoFijoScreenState createState() => _EditarActivoFijoScreenState();
}

class _EditarActivoFijoScreenState extends State<EditarActivoFijoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _editarActivoModel = EditarActivoModel();
  FFUploadedFile? _uploadedLocalFile;
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

  Future<void> _selectAndUploadImage() async {
    final selectedMedia = await selectMediaWithSourceBottomSheet(
      context: context,
      imageQuality: 100,
      allowPhoto: true,
    );

    if (selectedMedia != null &&
        selectedMedia
            .every((m) => validateFileFormat(m.storagePath, context))) {
      setState(() {
        _uploadedLocalFile = FFUploadedFile(
          bytes: selectedMedia.first.bytes,
          name: selectedMedia.first.storagePath.split('/').last,
          height: selectedMedia.first.dimensions?.height,
          width: selectedMedia.first.dimensions?.width,
          blurHash: selectedMedia.first.blurHash,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Activo Fijo'),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Mostrar imagen actual del activo
              _uploadedLocalFile != null
                  ? Image.memory(
                      _uploadedLocalFile!.bytes!,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      _editarActivoModel.foto ?? '',
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),

              // Botón para cambiar la imagen
              ElevatedButton(
                onPressed: () async {
                  _selectAndUploadImage();
                },
                child: Text('Cambiar Foto'),
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                child: TextFormField(
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
              ),
              // Agrega aquí los demás TextFormField para los campos que deseas editar

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para guardar los cambios
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
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
      FFUploadedFile? fotofile = _uploadedLocalFile;

      // Llamar a updateActivoData con los valores obtenidos
      updateActivoData(
          id, descripcion, dia, costo, lugar, marca, modelo, serial, fotofile);
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
    FFUploadedFile? fotofile,
  ) async {
    final url = 'https://apisi2.up.railway.app/api/acti/$id';
    print('URL de la solicitud: $url');
    try {
      final formData = FormData();
      formData.fields.addAll([
        MapEntry('descripcion', descripcion ?? ''),
        MapEntry('diaCompra',
            dia != null ? DateFormat('yyyy-MM-dd').format(dia) : ''),
        MapEntry('costo', costo?.toString() ?? ''),
        MapEntry('lugarCompra', lugar ?? ''),
        MapEntry('marca', marca ?? ''),
        MapEntry('modelo', modelo ?? ''),
        MapEntry('serial', serial?.toString() ?? ''),
      ]);

      if (fotofile != null) {
        formData.files.add(MapEntry(
          'foto',
          MultipartFile.fromBytes(
            fotofile.bytes!.toList(), // Convertir a List<int>
            filename:
                'nombre_del_archivo.jpg', // Reemplaza 'nombre_del_archivo' por el nombre real del archivo
          ),
        ));
      }

      final response = await Dio().put(
        url,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      if (response.statusCode == 200) {
        print('Datos del activo actualizados');
      } else {
        print('Error en la solicitud: ${response.statusCode}');
        print('Mensaje de error: ${response.data}');
      }
    } catch (e) {
      print('Excepción durante la solicitud updateActivoData: $e');
    }
  }
}
