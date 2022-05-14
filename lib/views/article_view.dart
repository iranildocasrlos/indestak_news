import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String blogUrl;
  const ArticleView({
    Key? key,
    required this.blogUrl
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer <WebViewController>_completer =  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Indestak",
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text("News",
              style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,

        actions: [
          Opacity(opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save)
            ),
          )
        ],

      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
