// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'package:provider/provider.dart';
import '../home/home_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../menu_profile/mprofile_widget.dart';
import '../user_session.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> login(String nroregistro, String password) async {
    final url = 'https://apisi2.up.railway.app/api/usuarM';

    final loginData = {'usuario': nroregistro.toString(), 'contra': password};
    print('Respuesta del servidor REGISTRO: $nroregistro');

    print('Respuesta del servidor PASSWORD: $password');
    try {
      final response = await http.post(Uri.parse(url), body: loginData);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Verifica si el inicio de sesión fue exitoso en base a la respuesta de la API
        if (responseData == "1") {
          UserSession userSession =
              Provider.of<UserSession>(context, listen: false);

          // Asigna el valor de nroregistro al iniciar sesión correctamente
          userSession.nroregistro = nroregistro;
          await userSession.fetchUserData(); // Obtener los datos del usuario

          return true;
        } else {
          return false;
        }
      } else {
        print('Error en la solicitud: ${response.statusCode} auth');

        return false;
      }
    } catch (error) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _model = LoginModel(nroregistro: 0, password: '');
  }

  @override
  void dispose() {
    _model.dispose(); // Llamada al método dispose() de LoginModel
    super.dispose();
  }

  Future<void> _delayedPop(BuildContext context) async {
    unawaited(
      Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
          transitionDuration: Duration.zero,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          opaque: false,
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF101213),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(
              'https://scontent.fvvi1-2.fna.fbcdn.net/v/t1.15752-9/357993249_811039503796468_777590915532820229_n.png?_nc_cat=109&ccb=1-7&_nc_sid=ae9488&_nc_ohc=erUBhdqGeN8AX8bw6os&_nc_ht=scontent.fvvi1-2.fna&oh=03_AdRXib1EbwVlTpHhSKrtw57x5rS9Uew1ShvDHCtcnJjb_Q&oe=64C91B2D',
            ).image,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://scontent.fvvi1-2.fna.fbcdn.net/v/t1.15752-9/357987377_1298359894405196_5292298633824816883_n.png?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=ZGM3wCamvAIAX8Z_98x&_nc_ht=scontent.fvvi1-2.fna&oh=03_AdRFmFZzX3aT8Iu60NOiifOkWdCniv13zIVSgneu572FEw&oe=64C92525',
                          width: MediaQuery.of(context).size.width * 0.823,
                          height: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Bienvenido!',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 24.0),
                        child: Text(
                          'Tome el control con nuestra plataforma de gestión y seguimiento de activos!',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.nroRegistroController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nombre de Usuario',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          hintText: 'Escribe tu usuario aquí ',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 0.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF101213),
                            ),
                        // validator: _model.emailAddressControllerValidator
                        //     .asValidator(context),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.passwordController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            hintText: 'Escribe tu contraseña aquí',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF101213),
                                  ),
                          // validator: _model.passwordControllerValidator
                          //     .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crear cuenta',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFF9F9F9),
                                ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            // Obtener los valores ingresados en los campos de correo y contraseña
                            String nroregistro =
                                _model.nroRegistroController.text;
                            String password = _model.passwordController.text;
                            // Llamar a la función de inicio de sesión
                            login(nroregistro, password).then((success) {
                              if (success) {
                                UserSession userSession;
                                try {
                                  userSession =
                                      UserSession(nroregistro: nroregistro);

                                  userSession.nroregistro = nroregistro;
                                } catch (e) {
                                  print('Excepción durante la solicitud: $e');
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeWidget()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Inicio de sesión fallido'),
                                  ),
                                );
                              }
                            });
                          },
                          text: 'Iniciar Sesión',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF39E6EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
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
}
