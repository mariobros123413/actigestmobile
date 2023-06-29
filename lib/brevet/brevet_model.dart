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
  String? imageUrl;

  @override
  BrevetModel(
      {this.id,
      this.ci,
      this.nombre,
      this.foto,
      this.catlicencia,
      this.fecexpedicion,
      this.fecvencimiento});

  Future<void> fetchBrevetData(BuildContext context) async {}

// ...

  Future<void> updateBrevetData() async {}

  Future<void> createBrevet() async {}

  Future<bool> hasDuplicateBrevets() async {
    return true;
  }
  // late BrevetModel BrevetModel;

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
