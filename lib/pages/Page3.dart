import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: WebviewScaffold(
          url: "https://www.bible.com/bible/1/GEN.1.KJV",
        ),
      ),
    );


  }
}
