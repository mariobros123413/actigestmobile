// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'mantenimiento/mantenimiento_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'activo/activo_widget.dart';
import '../peticiones/peticiones_model.dart';
import 'activo/cactivo_widget.dart';

import 'activo/activo_model.dart';
import 'login/login_widget.dart';
import 'menu_profile/mprofile_widget.dart';
import 'user_session.dart';
import 'vehicle/vehicle_model.dart';
import 'home/home_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// Inicializar OneSignal
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("97009778-a5ce-4994-bf86-bd499137d95f");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Permiso aceptación: $accepted");
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserSession>(
          create: (_) => UserSession(),
        ),
        ChangeNotifierProvider<ActivoModel>(
          create: (_) => ActivoModel(),
        ),
        ChangeNotifierProvider<MantenimientoModel>(
          create: (_) => MantenimientoModel(),
        ),
        ChangeNotifierProvider<ProfileWidgetModel>(
          create: (_) => ProfileWidgetModel(),
        ),
        ChangeNotifierProvider<PeticionesModel>(
          create: (_) => PeticionesModel(),
        ),
        ChangeNotifierProvider<VehicleModel>(
          create: (_) => VehicleModel(),
        ),
        ChangeNotifierProvider<HomeModel>(
          create: (_) => HomeModel(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Inicializar OneSignal
    // OneSignal.shared.setNotificationOpenedHandler(
    //   (OSNotificationOpenedResult result) {
    //     // Procesar la notificación abierta
    //     final OSNotificationAction? action = result.action;
    //     final OSNotificationPayload payload = result.notification.payload;
    //     final String? description = payload.additionalData?['description'];

    //     // Mostrar una alerta o realizar otras acciones según la notificación abierta
    //     showDialog(
    //         // ...
    //         );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ActiGest',
      theme: ThemeData(
          // Configura el tema
          ),
      home: LoginWidget(),
    );
  }
}
