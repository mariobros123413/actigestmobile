import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../vehicle/vehicle_model.dart';
import 'activo_model.dart';
export '../vehicle/vehicle_model.dart';

import 'dart:async';
import 'dart:convert';
// import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edactivo_widget.dart';

class ActivoWidget extends StatefulWidget {
  const ActivoWidget({Key? key}) : super(key: key);

  @override
  _ActivoWidgetState createState() => _ActivoWidgetState();
}

class _ActivoWidgetState extends State<ActivoWidget> {
  late ActivoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = Provider.of<ActivoModel>(context, listen: false);
    _model.fetchListaActivos();
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> _refreshActivos() async {
    // Lógica para cargar nuevas solicitudes aquí
    _model.fetchListaActivos();
    // Esperar un tiempo simulado de 2 segundos (reemplazar con tu lógica de carga real)
    await Future.delayed(Duration(seconds: 2));

    // Actualizar el estado para mostrar las nuevas solicitudes
    setState(() {
      // Actualizar las solicitudes en el modelo o cargar las nuevas solicitudes aquí
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF14181B),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Navegar hacia atrás
            },
          ),
          title: Text(
            'Lista de Activos Fijos',
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: _refreshActivos,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Activos Fijos registrados hasta la fecha',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      if (_model.apiDataList != null)

                        // Aquí empieza el bucle para generar las cards dinámicamente
                        for (var cardData in _model.apiDataList!)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x411D2429),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 1, 1, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          'https://uploadgerencie.com/imagenes/concepto-o-definicion-de-activo-fijo.png',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cardData.descripcion ?? '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 8, 0),
                                              child: AutoSizeText(
                                                '${cardData.marca ?? ''} ${cardData.modelo ?? ''}',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              showCustomModal(
                                                  context, cardData);
                                            },
                                            child: Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF606A85),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 4, 8),
                                          child: Text(
                                            '\$${cardData.costo.toString()}',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomModal(BuildContext context, ActivoModel card) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(card.descripcion ?? ''),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://uploadgerencie.com/imagenes/concepto-o-definicion-de-activo-fijo.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('ID: ${card.id.toString() ?? ''}'),
              Text('Dia: ${card.dia.toString().substring(0, 10)}'),
              Text('Marca: ${card.marca ?? ''}'),
              Text('Modelo: ${card.modelo ?? ''}'),
              Text('Costo: \$${card.costo.toString()}'),
              Text('Lugar de Compra: ${card.lugar}'),
              Text('Marca: ${card.marca}'),
              Text('Modelo: ${card.modelo}'),
              Text('Serial: ${card.serial}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Obtener los valores ingresados en los campos de correo y contraseña
              // Llamar a la función de inicio de sesión
              delete(card.id).then((success) {
                if (success) {
                  try {} catch (e) {
                    print('Excepción durante la solicitud AWDelete: $e');
                  }

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Eliminación de activo fallido'),
                    ),
                  );
                }
              });
            },
            child: Text('Eliminar'),
          ),
          TextButton(
            onPressed: () {
              // Acción para editar el activo fijo
              Navigator.of(context).pop(); // Cerrar el AlertDialog actual
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditarActivoFijoScreen(activo: card),
                ),
              );
            },
            child: Text('Editar'),
          ),
        ],
      ),
    );
  }

  Future<bool> delete(int? id) async {
    final url = 'https://apisi2.up.railway.app/api/acti/$id';
    print(id);
    try {
      final response = await http.delete(Uri.parse(url));
      print(response.toString());
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Error en la solicitud: ${response.statusCode} AWdelete');

        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
