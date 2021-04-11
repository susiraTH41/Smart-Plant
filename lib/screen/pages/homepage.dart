import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController controller;
  String url="http://158.108.97.158:3000/home"; 
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)),
              child: InAppWebView(
                initialUrl: url,
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(debuggingEnabled: false)),
                onWebViewCreated: (webViewController) =>
                    controller = webViewController,
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ))
          ],
        )),
      ),
    );
  }
}
