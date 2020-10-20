import 'package:flutter/material.dart';

class ListDevs extends StatefulWidget {
  @override
  _ListDevsState createState() => _ListDevsState();
}

class _ListDevsState extends State<ListDevs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[Text("List Devs")],
          ),
        ),
      ),
    );
  }
}
