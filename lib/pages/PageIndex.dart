import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fwf/widgets/AppBarWidget.dart';

class Live2 extends StatefulWidget {
  @override
  _Live2State createState() => _Live2State();
}

class _Live2State extends State<Live2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Center(

        child: WebviewScaffold(
          url: "https://fifministriesabudhabi.online.church",

        ),
      ),
    );


  }
}
