import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmf;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart'
    as gm;
import 'package:http/http.dart' as http;
import 'package:google_map_polyline_new/google_map_polyline_new.dart';

// import '/backend/backend.dart';

class PublicRutaModel extends ChangeNotifier {
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
  DateTime? datePicked1;
  DateTime? datePicked2;
  PublicRutaModel(
      {this.id,
      this.idusuarioconductor,
      this.inicio,
      this.finals,
      this.asientos,
      this.destino,
      this.paradaintermedia});

  Future<void> updateRoute(List<gmf.LatLng> routePoints) async {}

  Future<void> createRuta() async {}

  // Completer<GoogleMapController> _controllerCompleter =
  //     Completer<GoogleMapController>();

  /// Initialization and disposal methods.
  LatLng? googleMapsCenter;
  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.
  final paradaintermediaController = TextEditingController();
  final horasalidaController = TextEditingController();
  final horaregresoController = TextEditingController();
  final asientosController = TextEditingController();
  final destinoController = TextEditingController();

  /// Additional helper methods are added here.
}
