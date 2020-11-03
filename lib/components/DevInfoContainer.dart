import 'package:findev/model/Dev.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';

Widget devInfoContainer(Dev dev, BuildContext context) {
  Future<void> sendMail() async {
    final Email email = Email(
        subject: "finDev - Proposta",
        recipients: [dev.email],
        body:
            "Olá ${dev.name}, estou entrando em contato para contratar seus serviços.",
        isHTML: false);
    try {
      await FlutterEmailSender.send(email);
      print("Email enviado");
    } catch (error) {
      print(error);
    }
  }

  return Container(
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
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF476268),
                    child: CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: Image.network(
                          dev.githubProfilePicUrl,
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
                    Text(dev.name,
                        style: GoogleFonts.offside(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ...dev.techs.map(
                            (e) => Text(
                              e,
                              style: GoogleFonts.offside(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            width: 65,
                            child: Text(
                            dev.location,
                            style: GoogleFonts.offside(
                              textStyle: TextStyle(),
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    ButtonTheme(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(5),
                        color: Color(0xFF476268),
                        onPressed: () {
                          Navigator.pushNamed(context, "/webview", arguments: dev.githubUserName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.github,
                                color: Color(0xFFF1F1F1))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ButtonTheme(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(5),
                        color: Color(0xFF476268),
                        onPressed: () {
                          sendMail();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.mail_outline,
                              color: Color(0xFFF1F1F1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ])
          );
}
