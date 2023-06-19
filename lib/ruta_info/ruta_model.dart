import 'dart:convert';

// import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RutaModel extends ChangeNotifier {
  FocusNode? unfocusNode; // Declaración con nullable
  int? id;
  String? inicio;
  String? finals;
  String? asientos;
  DateTime? destino;
  String? paradaintermedia;
  String? posactual;
  List<RutaModel>? apiDataList;
  LatLng? currentLocation;

  RutaModel(
      {this.id,
      this.inicio,
      this.finals,
      this.asientos,
      this.destino,
      this.paradaintermedia,
      this.posactual});

  ///  State fields for stateful widgets in this page.
  Future<void> fetchApiData() async {
    print(id);
    try {
      final response = await http.get(
          Uri.parse('https://apiuniviaje-pgport.up.railway.app/api/ruta/$id'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        // Mapear los datos de la respuesta a instancias de HomeModel
        final apiData = data
            .map((item) => RutaModel(
                inicio: item['inicio'],
                finals: item['final'],
                asientos: item['asientos'],
                destino: item['destino'],
                paradaintermedia: item['paradaintermedia'],
                posactual: item['posactual']))
            .toList();

        // Hacer algo con los datos obtenidos, por ejemplo, almacenarlos en una lista en la clase HomeModel
        // Por ejemplo, asumiendo que tienes una lista llamada 'apiDataList' en HomeModel
        apiDataList = apiData;
        notifyListeners(); // Notificar a los listeners que los datos han sido actualizados
      } else {
        // Manejar el caso de error en la respuesta de la API
      }
    } catch (error) {
      // Manejar el error de la solicitud HTTP
      print('ERROR fetchApiData() : $error');
    }
  }

// ...

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
