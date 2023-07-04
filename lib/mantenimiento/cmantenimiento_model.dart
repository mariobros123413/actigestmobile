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

class CactivoModel extends ChangeNotifier {
  int? id;
  String? nroregistro;
  String? password;
  String? correo;
  String? nombre;
  int? celular;
  String? fotoperfil;
  String? carrera;
  String? horarioclases;
  String? preferenciasviaje;
  bool isDataLoaded = false;
  String? imageUrl;

  @override
  CactivoModel(
      {this.id,
      this.nroregistro,
      this.password,
      this.correo,
      this.nombre,
      this.celular,
      this.fotoperfil,
      this.carrera,
      this.horarioclases,
      this.preferenciasviaje});

  Future<void> fetchProfileData(BuildContext context) async {}

// ...

  Future<void> updateUsuarioData() async {}

  Future<void> createUsuario() async {}

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  final idController = TextEditingController();
  final nroregistroController = TextEditingController();
  final passwordController = TextEditingController();
  final correoController = TextEditingController();
  final nombreController = TextEditingController();
  final celularController = TextEditingController();
  final carreraController = TextEditingController();
  final horarioclasesController = TextEditingController();
  final preferenciasviajeController = TextEditingController();
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
