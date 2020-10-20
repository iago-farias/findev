import 'package:flutter/material.dart';
import 'view/HomeScreen.dart';
import 'view/CadastroDev.dart';
import 'view/ListDevs.dart';

class Routes extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomeScreen(),
        '/listdevs': (context) => ListDevs(),
        '/cadastro': (context) => CadastroDev(),
      }
  );
  }
}