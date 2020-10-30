import 'package:findev/controller/Dev_controller.dart';
import 'package:findev/model/Dev.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../controller/Dev_controller.dart';

class CadastroDev extends StatefulWidget {
  @override
  _CadastroDevState createState() => _CadastroDevState();
}

class _CadastroDevState extends State<CadastroDev> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController techsController = TextEditingController();
  TextEditingController githubUserNameController = TextEditingController();

  String userLocation = "";
  String githubProfilePicUrl = "";

  Future<String> getDados(String userLogin) async {
    String uri = "https://api.github.com/users/" + userLogin;
    http.Response response = await http.get(uri);
    Map<String, dynamic> user = json.decode(response.body);

    // "message": "Not Found"
    if (user['message'] != "Not Found") {
      userLocation = user['location'];
      githubProfilePicUrl = user['avatar_url'];

      return "Usuário encontrado";
    } else {
      return "Usuário não encontrado";
    }
  }

  _displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor:
          message == "Erro no cadastro" ? Colors.red[800] : Colors.green[900],
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void createDev() async {
    DevController devController = new DevController();
    List<String> userTechs = techsController.text.trim().split(",");

    String message = await getDados(githubUserNameController.text);

    print(message);

    if (message != "Erro no cadastro") {
      Dev dev = new Dev(nameController.text, githubUserNameController.text,
          githubProfilePicUrl, userLocation, userTechs);

      devController.save(dev).then((res) => print(res));

      clearTextFields();

      _displaySnackBar(context, "Dev cadastrado");

      return;
    }

    _displaySnackBar(context, message);
  }

  void clearTextFields() {
    nameController.text = "";
    emailController.text = "";
    techsController.text = "";
    githubUserNameController.text = "";

    userLocation = "";
    githubProfilePicUrl = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFF1F1F1),
        body: SingleChildScrollView(
          child: DefaultTextStyle(
              style: TextStyle(color: Color(0xFFFFFFFF)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 18),
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
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF476268),
                        ),
                        width: 307,
                        height: 600,
                        padding: EdgeInsets.all(15),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                buildTextInput("Insira seu login do Github",
                                 githubUserNameController),
                                buildTextInput(
                                    "Insira seu nome", nameController),
                                buildTextInput(
                                    "Insira seu email", emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    placeHolder: "exemplo@exemplo.com"),
                                buildTextInput(
                                    "Insira as technologias que você tem domínio",
                                    techsController,
                                    placeHolder: "Tech 1, Tech 2, Tech 3, ..."),
                                const SizedBox(height: 25,),
                                ButtonTheme(
                                  minWidth: 250,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    padding: EdgeInsets.all(10),
                                    color: Color(0xFFF1F1F1),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        createDev();
                                      }
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
                              ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )),
        ));
  }

  Widget buildTextInput(String label, TextEditingController controller,
      {TextInputType keyboardType, String placeHolder}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.offside(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
                  if (value.isEmpty) {
                    return "Por favor preencha esse campo";
                  }

                  return null;
                },
          controller: controller,
          keyboardType:
              keyboardType != null ? keyboardType : TextInputType.text,
          decoration: InputDecoration(
              hintText: placeHolder,
              filled: true,
              fillColor: Color(0xFFF1F1F1),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        )
      ],
    );
  }
}
