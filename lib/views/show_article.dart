import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_macos_webview/flutter_macos_webview.dart';

void main() => runApp(App(blogUrl: "",));

class App extends StatelessWidget {
  final String blogUrl;

  const App({
    Key? key,
    required this.blogUrl
  }) : super(key: key);

  Future<void> _onOpenPressed(PresentationStyle presentationStyle) async {
    final webview = FlutterMacOSWebView(
      onOpen: () => print('Opened'),
      onClose: () => print('Closed'),
      onPageStarted: (url) => print('Page started: $url'),
      onPageFinished: (url) => print('Page finished: $url'),
      onWebResourceError: (err) {
        print(
          'Error: ${err.errorCode}, ${err.errorType}, ${err.domain}, ${err.description}',
        );
      },
    );

    await webview.open(
      url: this.blogUrl,
      presentationStyle: presentationStyle,
      size: Size(400.0, 400.0),
      userAgent:
      'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
    );
     print(" Endereço passado ${this.blogUrl}");
    await Future.delayed(Duration(seconds: 5));
    // await webview.close();
  }

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
      ),
      
      body: Container(
        child: Row(
          children: [
            Text(this.blogUrl)
          ],
        ),
      ),



    );

  }
  
  
}