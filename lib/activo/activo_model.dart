// ignore_for_file: unused_import

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import '../user_session.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:dio/dio.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:http_parser/http_parser.dart';

class ActivoModel extends ChangeNotifier {
  int? id;
  String? descripcion;
  DateTime? dia;
  int? costo;
  String? lugar;
  String? marca;
  String? modelo;
  int? serial;
  String? foto;
  List<ActivoModel>? apiDataList;
  File? fotoFile;

  @override
  ActivoModel(
      {this.id,
      this.descripcion,
      this.dia,
      this.costo,
      this.lugar,
      this.marca,
      this.modelo,
      this.serial,
      this.foto});

  Future<void> fetchListaActivos() async {
    try {
      final response =
          await http.get(Uri.parse('https://apisi2.up.railway.app/api/acti'));
      if (response.statusCode == 200) {
        print(response.body);

        final data = json.decode(response.body) as List<dynamic>;

        // Mapear los datos de la respuesta a instancias de HomeModel
        final apiData = data
            .map((item) => ActivoModel(
                  id: item['id'],
                  descripcion: item['descripcion'],
                  dia: item['diacompra'] != null
                      ? DateTime.parse(item['diacompra'])
                      : null,
                  costo: item['costo'],
                  lugar: item['lugarcompra'],
                  marca: item['marca'],
                  modelo: item['modelo'],
                  serial: item['serial'],
                  foto:
                      'https://apisi2.up.railway.app/api/actiI/${item['id']}', // URL de la imagen
                ))
            .toList();
        print(apiData);
        // Hacer algo con los datos obtenidos, por ejemplo, almacenarlos en una lista en la clase HomeModel
        // Por ejemplo, asumiendo que tienes una lista llamada 'apiDataList' en HomeModel
        apiDataList = apiData;
        notifyListeners(); // Notificar a los listeners que los datos han sido actualizados
      } else {
        // Manejar el caso de error en la respuesta de la API
      }
    } catch (error) {
      // Manejar el error de la solicitud HTTP
      print('ERROR fetchListaActivos() : $error');
    }
  }

// ...

  Future<void> updateActivoData(
      int? id,
      String? descripcion,
      DateTime? dia,
      int? costo,
      String? lugar,
      String? marca,
      String? modelo,
      int? serial,
      File? fotoFile) async {
    final url = 'https://apisi2.up.railway.app/api/acti/$id';
    print(id);
    try {
      final body = <String, dynamic>{
        'descripcion': descripcionController.text,
        'diacompra': dia != null ? DateFormat('yyyy-MM-dd').format(dia!) : '',
        'costo': costoController.text,
        'lugarcompra': lugarController.text,
        'marca': marcaController.text,
        'modelo': modeloController.text,
        'serial': serialController.text
      };
      print('Body de la solicitud: $body');

      // if (uploadedLocalFile != null && uploadedLocalFile.bytes != null) {
      //   final encodedImage = await base64.encode(uploadedLocalFile.bytes!);
      //   body['foto'] = encodedImage;
      // }

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

  Future<void> createActivo() async {
    final url = 'https://apisi2.up.railway.app/api/acti';

    try {
      final formData = FormData.fromMap({
        'id': idController.text,
        'descripcion': descripcionController.text,
        'diaCompra': diaController.text,
        'costo': costoController.text,
        'lugarCompra': lugarController.text,
        'marca': marcaController.text,
        'modelo': modeloController.text,
        'serial': serialController.text,
        // Añadir la imagen seleccionada al FormData
        'img': MultipartFile.fromBytes(
          uploadedLocalFile.bytes!,
          filename:
              'imagen_activofijo.jpg', // Cambiar el nombre del archivo según tu necesidad
        ),
      });
      print('Body de la solicitud: $formData');

      final response = await Dio().post(
        url,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode == 200) {
        print('Datos del activo creados');
        // notifyListeners();
      } else {
        print('Error en la solicitud: ${response.statusCode} createActivo');
      }
    } catch (e) {
      print('Excepción durante la solicitud createActivo: $e');
    }
  }
  // late BrevetModel BrevetModel;

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  final idController = TextEditingController();

  final descripcionController = TextEditingController();
  final diaController = TextEditingController();
  final costoController = TextEditingController();
  final lugarController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final serialController = TextEditingController();

  TextEditingController? textController4;

  void dispose() {
    // nroplacaController.dispose();
    // modeloController.dispose();
    // anioController.dispose();
    // capacidadController.dispose();
    // fotovehiculoController.dispose();
    // caracteristicasespecialesController.dispose();
    textController4?.dispose();
  }
}
