import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/DevInfoContainer.dart';
import '../model/Dev.dart';

class ListDevs extends StatefulWidget {
  @override
  _ListDevsState createState() => _ListDevsState();
}

class _ListDevsState extends State<ListDevs> {
  var devs = [
    {
      'name': "Dev 1",
      'email': "dev@teste.com",
      'githubUserName': 'devGit1',
      'techs': ["Java", "C"],
    },
    {
      'name': "Dev 2",
      'email': "dev@teste.com",
      'githubUserName': 'devGit1',
      'techs': ["Java"],
    },
    {
      'name': "Dev 3",
      'email': "dev@teste.com",
      'githubUserName': 'devGit1',
      'techs': ["Java", "C", "C++"],
    },
  ];

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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: ButtonTheme(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(10),
                      color: Color(0xFF476268),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Filtrar tecnologias",
                              style: GoogleFonts.offside(
                                color: Color(0xFFF1F1F1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                          Icon(
                            Icons.filter_list,
                            color: Color(0xFFF1F1F1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ...devs.map(
                  (dev) => devInfoContainer(
                      Dev.fromJson(dev, '6cPeQrkH4ajpYSdEcaJT')),
                ),
              ],
            ),
          ),
        ));
  }
}
