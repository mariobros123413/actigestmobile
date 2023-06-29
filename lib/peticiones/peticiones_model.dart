import 'dart:convert';
import 'dart:ffi';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class PeticionesModel extends ChangeNotifier {
  int? id;
  int? idusuariopasajero;
  int? idusuariconductor;
  int? idruta;
  String? foto;
  String? preferenciasviaje;

  String? ubicacionrecogida;
  String? destino;
  String? horadeseadaviaje;
  Bool? aceptacion;
  String? nombre;
  String? puntuacion;
  List<PeticionesModel>? apiDataList;
  gm.LatLng? ubicacion;
  PeticionesModel(
      {this.id,
      this.idusuariopasajero,
      this.idusuariconductor,
      this.idruta,
      this.foto,
      this.preferenciasviaje,
      this.ubicacionrecogida,
      this.horadeseadaviaje,
      this.aceptacion,
      this.nombre,
      this.destino,
      this.puntuacion,
      this.ubicacion});
  final unfocusNode = FocusNode();

  Future<void> fetchApiSolicitud() async {}

  Future<void> updateSolicitud(int? idusuariopasajero, int? idruta) async {}

  Future<void> terminarRuta() async {}

  gm.LatLng? _convertStringToLatLng(String? ubicacionRecogida) {}

  String formatTime(DateTime dateTime) {
    final formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  /// Initialization and disposal methods.
  String? getFormattedTime(DateTime? dateTime) {
    if (dateTime != null) {
      return formatTime(dateTime);
    }
    return null;
  }

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
