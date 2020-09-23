import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fwf/widgets/AppBarWidget.dart';

class Bible extends StatefulWidget {
  @override
  _BibleState createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
      body: Center(
        child: WebviewScaffold(
          url: "https://www.bible.com/bible/1/GEN.1.KJV",

        ),
      ),
    );


  }
}
