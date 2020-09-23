import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fwf/widgets/AppBarWidget.dart';

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
      body: Center(
        child: WebviewScaffold(
          url: "https://livestream.com/accounts/19491040/events/8258678/player?enableInfoAndActivity=false&defaultDrawer=&autoPlay=false&mute=false",

        ),
      ),
    );


  }
}
