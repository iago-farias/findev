import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CadastroDev extends StatefulWidget {
  @override
  _CadastroDevState createState() => _CadastroDevState();
}

class _CadastroDevState extends State<CadastroDev> {
  Map<String, dynamic> user;

  TextEditingController loginInput = TextEditingController();

  Future<Map<String, dynamic>> getDados(String userLogin) async {
    String uri = "https://api.github.com/users/" + userLogin;
    http.Response response = await http.get(uri);
    user = json.decode(response.body);
    // "message": "Not Found"
    if (user['message'] != "Not Found") {
      print(user['login']);
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _loginController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: DefaultTextStyle(
          style: TextStyle(color: Color(0xFFFFFFFF)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("lib/assets/Logo.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF476268),
                      ),
                      width: 307,
                      height: 238,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Insira seu login do Github",
                              style: GoogleFonts.offside(
                                color: Color(0xFFFFFFFF),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextField(
                              controller: _loginController,
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 250,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                padding: EdgeInsets.all(10),
                                color: Color(0xFFF1F1F1),
                                onPressed: () {
                                  getDados(_loginController.text);
                                },
                                child: Text(
                                  "Confirmar cadastro",
                                  style: GoogleFonts.offside(
                                    color: Color(0xFF476268),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ]))
                ],
              ),
            ],
          )),
    );
  }
}
