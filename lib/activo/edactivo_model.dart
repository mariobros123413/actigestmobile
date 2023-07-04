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

class EditarActivoModel {
  int? id;
  String? descripcion;
  DateTime? dia;
  int? costo;
  String? lugar;
  String? marca;
  String? modelo;
  int? serial;
  String? foto;
  // Agrega aquí los demás campos que desees editar

  EditarActivoModel(
      {this.id,
      this.descripcion,
      this.dia,
      this.costo,
      this.lugar,
      this.marca,
      this.modelo,
      this.serial,
      this.foto

      // Inicializa los demás campos aquí si es necesario
      });
}
