import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      'whatsapp': "999999999",
    },
    {
      'name': "Dev 2",
      'email': "dev@teste.com",
      'githubUserName': 'devGit1',
      'techs': ["Java", "C"],
      'whatsapp': "999999999",
    },
    {
      'name': "Dev 3",
      'email': "dev@teste.com",
      'githubUserName': 'devGit1',
      'techs': ["Java", "C"],
      'whatsapp': "999999999",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: Container(
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
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0x57044655),
                ),
                width: 350,
                height: 170,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[                                                
                         Container(
                           alignment: Alignment.center,
                           child:  CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFF476268),
                          child: CircleAvatar(
                          radius: 45,
                          child: ClipOval(
                            child: Image.network(
                              'https://avatars3.githubusercontent.com/u/61480933?v=4',
                              frameBuilder: (BuildContext context, Widget child,
                                  int frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                }
                                return AnimatedOpacity(
                                  child: child,
                                  opacity: frame == null ? 0 : 1,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                          ), 
                          ),
                          ),
                         ),
                         
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Nome"),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("Techs 1"),
                                  Text("Techs 2"),
                                  Text("Techs 3"),
                                ],
                              ),
                              Column(
                                children: <Widget>[Text("Bio")],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("Botões"),
                            ],
                          ),
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
