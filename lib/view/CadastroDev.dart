import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<Map<String, dynamic>> getDados() async {
    http.Response response =
        await http.get("https://api.github.com/users/mateusmsc");
    user = json.decode(response.body);

    print(user['login']);
  }

  @override
  Widget build(BuildContext context) {

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
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        TextField(

                        ),
                        ButtonTheme(
                          minWidth: 250,
                          child: RaisedButton(
                            padding: EdgeInsets.all(10),
                            color: Color(0xFFF1F1F1),
                            onPressed: () {
                            
                            },
                            child: Text("Confirmar Cadastro",
                                style: TextStyle(
                                    color: Color(0xFF476268), fontSize: 22)),
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
