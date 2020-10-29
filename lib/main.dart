/*
  void criarDev() async {
    var techs = ['Python', 'ReactNative', 'Flutter'];
    Dev dev = Dev(
        "Mateus Costa",
        "mateusmsc",
        'https://avatars0.githubusercontent.com/u/44880846?v=4',
        'Brasília, Brazil',
        techs);
    DevController devController = DevController();
    devController.save(dev).then((res) => print(res));
  }

  void getDevs() {
    DevController devController = DevController();
    devController.findAll().then((res) => print(res));
  }

  void updateDev() {
    Dev dev = Dev(
        "Henrique mariano",
        "henrique-mariano",
        'https://avatars0.githubusercontent.com/u/44880846?v=4',
        'Goiás, Brazil',
        ['Go lang', 'PLSQL'],
        id: "1");
    DevController devController = DevController();
    devController.save(dev).then((res) => print(res));
  }
  */

import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(backgroundColor: Color(0xFFF1F1F1)),
    home: Routes(),
  ));
}
