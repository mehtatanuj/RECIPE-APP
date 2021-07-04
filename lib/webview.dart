import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class RecipeView extends StatefulWidget {
  String url;
  RecipeView(this.url);
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  String finalurl;

  final Completer<WebViewController> contoller = Completer<WebViewController>();
  @override
  void initState() {
    // TODO: implement initState
    if (widget.url.toString().contains("http://")) {
      finalurl = widget.url.toString().replaceAll("http://", "https://");
    } else {
      finalurl = widget.url;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lets make this '),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.red,
                Colors.orange,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: WebView(
            initialUrl: finalurl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                contoller.complete(webViewController);
              });
            }),
      ),
    );
  }
}
