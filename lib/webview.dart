import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartgrocery/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  String url;
  final bool lightmode;
  WebViewExample(this.url,this.lightmode);
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }
  bool isLoading=true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: widget.lightmode?lightTheme:darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Recipe', style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 26.0,
            fontFamily: 'Montserrat',
            color: Colors.green[200],
          )),
        ),
        body:  Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading ? Center( child: CircularProgressIndicator(color: Colors.green[200],),)
                : Stack(),
          ],
        ),
      ),
    );
  }

}