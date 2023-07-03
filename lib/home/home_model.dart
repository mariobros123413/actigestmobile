import '../flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

/// Initialization and disposal methods.
import 'package:http/http.dart' as http;
import 'dart:convert';

//
class HomeModel extends ChangeNotifier {
  FocusNode? unfocusNode; // Declaración con nullable
  int? id;
  String? imageUrl;
  String? title;
  String? stars;
  DateTime? horariosal;
  DateTime? horariolleg;
  List<HomeModel>? apiDataList;
  bool isLoading = false;

  HomeModel({
    this.id,
    this.imageUrl,
    this.title,
    this.stars,
    this.horariosal,
    this.apiDataList,
    this.horariolleg,
  });
  // final unfocusNode = FocusNode();

// Dentro de la clase HomeModel
  Future<void> fetchApiData() async {}
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

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode?.dispose(); // Llama a dispose si unfocusNode no es null
    unfocusNode = null; // Establece unfocusNode en null
    super.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
