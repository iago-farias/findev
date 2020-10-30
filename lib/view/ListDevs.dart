import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/DevInfoContainer.dart';
import '../model/Dev.dart';
import '../controller/Dev_controller.dart';

class ListDevs extends StatefulWidget {
  @override
  _ListDevsState createState() => _ListDevsState();
}

class _ListDevsState extends State<ListDevs> {
  List<Dev> devs = [];

  /*var devs = [
    {
      'name': "Iago",
      'email': "dev@teste.com",
      'githubUserName': 'iago-farias',
      'githubProfilePicUrl':
          "https://avatars3.githubusercontent.com/u/61480933?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java", "C"],
    },
    {
      'name': "Mateus",
      'email': "dev@teste.com",
      'githubUserName': 'mateusmsc',
      'githubProfilePicUrl':
          "https://avatars0.githubusercontent.com/u/44880846?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java"],
    },
    {
      'name': "Iago",
      'email': "dev@teste.com",
      'githubUserName': 'iago-farias',
      'githubProfilePicUrl':
          "https://avatars3.githubusercontent.com/u/61480933?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java", "C"],
    },
    {
      'name': "Mateus",
      'email': "dev@teste.com",
      'githubUserName': 'mateusmsc',
      'githubProfilePicUrl':
          "https://avatars0.githubusercontent.com/u/44880846?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java"],
    },
    {
      'name': "Iago",
      'email': "dev@teste.com",
      'githubUserName': 'iago-farias',
      'githubProfilePicUrl':
          "https://avatars3.githubusercontent.com/u/61480933?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java", "C"],
    },
    {
      'name': "Mateus",
      'email': "dev@teste.com",
      'githubUserName': 'mateusmsc',
      'githubProfilePicUrl':
          "https://avatars0.githubusercontent.com/u/44880846?v=4",
      'location': "Brasília, Brazil",
      'techs': ["Java"],
    },
  ];*/

  void loadDevs() async {
    DevController devController = new DevController();

    devs = await devController.findAll();
  }

  @override
  void initState(){
    loadDevs();

    super.initState();
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
                ...devs.map((dev) => devInfoContainer(dev, context)),
              ],
            ),
          ),
        ));
  }
}
