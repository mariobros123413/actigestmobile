// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserSession>(
          create: (_) => UserSession(),
        ),
        ChangeNotifierProvider<ActivoModel>(
          create: (_) => ActivoModel(),
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Configura el tema
          ),
      home: MyHomePage(key: GlobalKey(), title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginWidget()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class UserSession with ChangeNotifier {
//   int? nroregistro;

//   UserSession({this.nroregistro});
// }
