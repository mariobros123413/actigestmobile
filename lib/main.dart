// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:univiaje/brevet/brevet_widget.dart';
import 'package:univiaje/profile/profile_widget.dart';

import 'brevet/brevet_model.dart';
import 'login/login_widget.dart';
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
        ChangeNotifierProvider<ProfileModel>(
          create: (_) => ProfileModel(),
        ),
        ChangeNotifierProvider<VehicleModel>(
          create: (_) => VehicleModel(),
        ),
        ChangeNotifierProvider<BrevetModel>(
          create: (_) => BrevetModel(),
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
            MaterialPageRoute(builder: (context) => HomeWidget()),
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
