// ignore_for_file: unused_import

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import '../user_session.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:io';

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

class MantenimientoModel extends ChangeNotifier {
  int? id;
  int? idaf;
  String? titulo;
  String? descripcion;
  DateTime? fechainicio;
  String? responsable;
  int? costo;
  int? idestado;
  List<MantenimientoModel>? apiDataList;
  @override
  MantenimientoModel(
      {this.id,
      this.idaf,
      this.titulo,
      this.descripcion,
      this.fechainicio,
      this.responsable,
      this.costo,
      this.idestado});

  Future<void> fetchListaMant() async {
    try {
      final response =
          await http.get(Uri.parse('https://apisi2.up.railway.app/api/mant'));
      if (response.statusCode == 200) {
        print(response.body);

        final data = json.decode(response.body) as List<dynamic>;

        // Mapear los datos de la respuesta a instancias de HomeModel
        final apiData = data
            .map((item) => MantenimientoModel(
                id: item['id'],
                idaf: item['idaf'],
                titulo: item['titulo'],
                descripcion: item['descripcion'],
                fechainicio: item['fechainicio'] != null
                    ? DateTime.parse(item['fechainicio'])
                    : null,
                responsable: item['responsable'],
                costo: item['costo'],
                idestado: item['idestado']))
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

  Future<void> createMant() async {
    final url = 'https://apisi2.up.railway.app/api/mant';

    try {
      final body = <String, dynamic>{
        'idaf': idafController.text,
        'titulo': tituloController.text,
        'descripcion': descripcionController.text,
        'fechaInicio': fechainicioController.text,
        'responsable': responsableController.text,
        'costo': costoController.text,
        'idestado': idestadoController.text
      };
      print('Body de la solicitud: $body');

      // if (uploadedLocalFile != null && uploadedLocalFile.bytes != null) {
      //   final encodedImage = await base64.encode(uploadedLocalFile.bytes!);
      //   body['foto'] = encodedImage;
      // }

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
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
  final idafController = TextEditingController();
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();

  final fechainicioController = TextEditingController();
  final responsableController = TextEditingController();

  final costoController = TextEditingController();
  final idestadoController = TextEditingController();

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
