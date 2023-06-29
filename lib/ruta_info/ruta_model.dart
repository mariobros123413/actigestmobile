import 'dart:convert';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart'
    as gmf;

// import '/backend/backend.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';

import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RutaModel extends ChangeNotifier {
  FocusNode? unfocusNode; // Declaración con nullable
  int? id;
  int? idusuarioconductor;
  String? inicio;
  String? finals;
  LatLng? inicioLatLng;
  LatLng? finalLatLng;
  int? asientos;
  String? destino;
  String? paradaintermedia;
  // List<RutaModel>? apiDataList; //YA NO LO USO
  LatLng? currentLocation;

  List<gmf.LatLng>? waypointsList;

  RutaModel(
      {this.id,
      this.idusuarioconductor,
      this.inicio,
      this.finals,
      this.asientos,
      this.destino,
      this.paradaintermedia});

  Future<void> fetchApiData() async {}

// ...
  Future<void> crearPeticion(
      String? horadeseada, String? ubicacionrecogida) async {}

  String formatTime(DateTime dateTime) {
    final formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

// ...

// Dentro de tu clase HomeModel:
  String? getFormattedTime(DateTime? dateTime) {
    if (dateTime != null) {
      return formatTime(dateTime);
    }
    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
