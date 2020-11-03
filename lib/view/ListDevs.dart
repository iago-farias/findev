import 'package:flutter/material.dart';

import '../components/DevInfoContainer.dart';
import '../model/Dev.dart';
import '../controller/Dev_controller.dart';

class ListDevs extends StatefulWidget {
  @override
  _ListDevsState createState() => _ListDevsState();
}

class _ListDevsState extends State<ListDevs> {
  List<Dev> devs = [];
  DevController devController = new DevController();

  @override
  void initState(){
    super.initState();
    devController.findAll().then((dados) {
      setState(() {
        devs = dados;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF1F1F1),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.all(0),
                    color: Color(0xFF476268),
                    iconSize: 35,
                  ),
                ),
                Image.asset("lib/assets/Logo.png"),
                ...devs.map((dev) => devInfoContainer(dev, context)),
              ],
            ),
          ),
        ));
  }
}
