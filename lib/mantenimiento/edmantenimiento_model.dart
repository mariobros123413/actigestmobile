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

class EditarMantenimientoModel {
  int? id;
  int? idaf;
  String? titulo;

  String? descripcion;
  DateTime? fechainicio;
  String? responsable;

  int? costo;
  int? idestado;
  // Agrega aquí los demás campos que desees editar

  EditarMantenimientoModel(
      {this.id,
      this.idaf,
      this.titulo,
      this.descripcion,
      this.fechainicio,
      this.responsable,
      this.costo,
      this.idestado

      // Inicializa los demás campos aquí si es necesario
      });
}
