
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fwf/pages/Profile.dart';
Widget appBarWidget(context) {
  return AppBar(
    backgroundColor: Colors.deepPurple,
    elevation: 0.0,
      centerTitle: true,
      title:Text('Forward In Faith'),
//      Image.asset(
//      "assets/index.png",
//      width: 80,
//      height: 40,
//    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) =>
               ProfileScreen()
           ),
         );
        },
        icon: Icon(FontAwesomeIcons.user),
        color: Color(0xFF323232),
      ),
    ],
  );
}
