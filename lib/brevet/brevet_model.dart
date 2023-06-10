import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:univiaje/user_session.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BrevetModel extends ChangeNotifier {
  int? id;
  int? ci;
  String? nombre;
  String? foto;
  String? catlicencia;
  DateTime? fecexpedicion;
  DateTime? fecvencimiento;
  bool isDataLoaded = false;
  DateTime? datePicked1;
  DateTime? datePicked2;
  @override
  notifyListeners();
  BrevetModel(
      {this.id,
      this.ci,
      this.nombre,
      this.foto,
      this.catlicencia,
      this.fecexpedicion,
      this.fecvencimiento});

  Future<void> fetchBrevetData() async {
    print('haciendo el userssion');
    print(id);
    final url = 'https://apiuniviaje-production.up.railway.app/api/brevet/$id';
    print('object');
    print(id);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body.toString());
      if (response.statusCode == 200) {
        final userList = jsonDecode(response.body) as List<dynamic>;
        if (userList.isNotEmpty) {
          final userData = userList[0] as Map<String, dynamic>;
          id = userData['id'];
          ci = userData['ci'];
          nombre = userData['nombre'];
          foto = userData['foto'];
          catlicencia = userData['catlicencia'];
          final fecexpedicion = userData['fecexpedicion'];
          final fecvencimiento = userData['fecvencimiento'];
          isDataLoaded = true;

          // Actualizar los controladores con los nuevos valores
          ciController.text = ci.toString();
          nombreController.text = nombre ?? '';
          catlicenciaController.text = catlicencia.toString();
          datePicked1 = DateTime.parse(fecexpedicion);
          datePicked2 = DateTime.parse(fecvencimiento);
          print(ciController.text.toString());
          print('Brevet data fetched successfully. ID: $id');

          // notifyListeners();
        } else {
          print('No se encontraron datos del vehiculo');
          if (hasDuplicateBrevets() != true) {
            createBrevet();
          }
        }
      } else {
        print('Error en la solicitud: ${response.statusCode} getVehiculo');
      }
    } catch (e) {
      print('Excepción durante la solicitud getBrevet: $e');
    }
  }

  Future<void> updateBrevetData() async {
    final url = 'https://apiuniviaje-production.up.railway.app/api/brevet/$id';
    print(id);
    try {
      final body = {
        'ci': ciController.text,
        'nombre': nombreController.text,
        'catlicencia': catlicenciaController.text.toString(),
        'fecexpedicion': DateFormat('yyyy-MM-dd')
            .format(datePicked1!), // Formatear fecha a yyyy-MM-dd
        'fecvencimiento': DateFormat('yyyy-MM-dd')
            .format(datePicked2!), // Formatear fecha a yyyy-MM-dd
      };
      print(
          'Body de la solicitud: $body'); // Imprimir el cuerpo de la solicitud

      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      if (response.statusCode == 200) {
        print('Datos del brevet actualizados');
        // notifyListeners();
      } else {
        print('Error en la solicitud: ${response.statusCode} updateBrevet');
      }
    } catch (e) {
      print('Excepción durante la solicitud updateBrevet: $e');
    }
  }

  Future<void> createBrevet() async {
    final url =
        'https://apiuniviaje-production.up.railway.app/api/brevetcreate/$id';
    print(ci);

    try {
      final response = await http.post(Uri.parse(url));
      print(response.body.toString());
      if (response.statusCode == 200) {
        // El vehículo se creó correctamente
        print('Brevet creado correctamente');
        // notifyListeners();
      } else {
        print('Error en la solicitud: ${response.statusCode} createBrevet');
      }
    } catch (e) {
      print('Excepción durante la solicitud createBrevet: $e');
    }
  }

  Future<bool> hasDuplicateBrevets() async {
    final url =
        'https://apiuniviaje-production.up.railway.app/api/vehiculo/$id';

    try {
      final response = await http.get(Uri.parse(url));
      print(response.body.toString());
      if (response.statusCode == 200) {
        final userList = jsonDecode(response.body) as List<dynamic>;
        final filteredList =
            userList.where((userData) => userData['id'] == id).toList();
        return filteredList.length > 1;
      } else {
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción durante la solicitud hasDuplicateBrevets: $e');
    }

    return false; // Si hay algún error en la solicitud, se asume que no hay duplicados
  }
  // late BrevetModel BrevetModel;

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for nrci widget.
  // TextEditingController? nrciController;
  // String? Function(BuildContext, String?)? nrciControllerValidator;
  // // State field(s) for nombre widget.
  // TextEditingController? nombreController;
  // String? Function(BuildContext, String?)? nombreControllerValidator;
  // // State field(s) for catlicencia widget.
  // TextEditingController? catlicenciaController;
  // String? Function(BuildContext, String?)? catlicenciaControllerValidator;

  final ciController = TextEditingController();
  final nombreController = TextEditingController();
  final catlicenciaController = TextEditingController();
  final fecexpedicionController = TextEditingController();
  final fecvencimientoController = TextEditingController();

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
