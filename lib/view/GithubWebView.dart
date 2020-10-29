import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubWebView extends StatefulWidget {
  @override
  _GitHubWebViewState createState() => _GitHubWebViewState();
}

class _GitHubWebViewState extends State<GitHubWebView> {

  @override
  Widget build(BuildContext context) {
   String githubUserName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF476268),
        title: Text("Github"),
        centerTitle: true,
      ),
      body: WebView(
      initialUrl: "https://github.com/${githubUserName}",
    ),
    );
  }
}