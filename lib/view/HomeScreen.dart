import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      color: Color(0xFFF1F1F1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset("lib/assets/Logo.png"),
          Container(
            margin: EdgeInsets.only(top: 150.0),
            child: Column(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 330,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(10),
                    color: Color(0xFF476268),
                    onPressed: () {
                      Navigator.pushNamed(context, "/listdevs");
                    },
                    child: Text(
                      "Desejo encontrar Dev's",
                      style: GoogleFonts.offside(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ButtonTheme(
                  minWidth: 330,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(10),
                    color: Color(0xFF476268),
                    onPressed: () {
                      Navigator.pushNamed(context, "/cadastro");
                    },
                    child: Text("Sou um Dev",
                        style: GoogleFonts.offside(
                          color: Color(0xFFFFFFFF),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
