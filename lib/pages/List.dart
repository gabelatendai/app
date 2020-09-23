import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fwf/models/connect.dart';
import 'package:http/http.dart' as http;

class SchoolList extends StatefulWidget {
  SchoolList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  __Prolisttate createState() => __Prolisttate();
}

class __Prolisttate extends State<SchoolList> {
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  List<Connect>_Prolist = [];

  Future <Connect>getProducts() async {
    setState(() {
      loading = true;
    });
    _Prolist.clear();
    String urldata ="https://weddinghub.co.zw/fetch.php?connect=connect";
    final response = await http.get(urldata);
    // final response = await http.get(url + "?id=${user_id}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _Prolist.add(Connect.fromJson(i));
          loading = false;
        }
      });
    }
    print(urldata);
    print(_Prolist.length);

  }
  var loading = false;
//  final List<Map> _Prolist = [
//    {
//      "name": "Edgewick Scchol",
//      "location": "572 Statan NY, 12483",
//      "type": "Higher Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
//    },
//    {
//      "name": "Xaviers International",
//      "location": "234 Road Kathmandu, Nepal",
//      "type": "Higher Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
//    },
//    {
//      "name": "Kinder Garden",
//      "location": "572 Statan NY, 12483",
//      "type": "Play Group School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
//    },
//    {
//      "name": "WilingTon Cambridge",
//      "location": "Kasai Pantan NY, 12483",
//      "type": "Lower Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
//    },
//    {
//      "name": "Fredik Panlon",
//      "location": "572 Statan NY, 12483",
//      "type": "Higher Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
//    },
//    {
//      "name": "Whitehouse International",
//      "location": "234 Road Kathmandu, Nepal",
//      "type": "Higher Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
//    },
//    {
//      "name": "Haward Play",
//      "location": "572 Statan NY, 12483",
//      "type": "Play Group School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
//    },
//    {
//      "name": "Campare Handeson",
//      "location": "Kasai Pantan NY, 12483",
//      "type": "Lower Secondary School",
//      "logoText":
//      "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
//    },
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _Prolist.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pro=_Prolist[index];
                      return  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 110,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 3, color: secondary),
                                image: DecorationImage(
                                    image:AssetImage('assets/lp.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    pro.title,
                                    style: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(pro.location,
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.school,
                                        color: secondary,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(pro.contact,
                                          style: TextStyle(
                                              color: primary, fontSize: 13, letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );;
                    }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Institutes",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search School",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//  Widget buildList(BuildContext context, int index) {
//    return Container(
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(25),
//        color: Colors.white,
//      ),
//      width: double.infinity,
//      height: 110,
//      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Container(
//            width: 50,
//            height: 50,
//            margin: EdgeInsets.only(right: 15),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(50),
//              border: Border.all(width: 3, color: secondary),
//              image: DecorationImage(
//                  image:AssetImage('assets/lp.png'),
//                  fit: BoxFit.fill),
//            ),
//          ),
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  _Prolist[index]['name'],
//                  style: TextStyle(
//                      color: primary,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 18),
//                ),
//                SizedBox(
//                  height: 6,
//                ),
//                Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.location_on,
//                      color: secondary,
//                      size: 20,
//                    ),
//                    SizedBox(
//                      width: 5,
//                    ),
//                    Text(_Prolist[index]['location'],
//                        style: TextStyle(
//                            color: primary, fontSize: 13, letterSpacing: .3)),
//                  ],
//                ),
//                SizedBox(
//                  height: 6,
//                ),
//                Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.school,
//                      color: secondary,
//                      size: 20,
//                    ),
//                    SizedBox(
//                      width: 5,
//                    ),
//                    Text(_Prolist[index]['type'],
//                        style: TextStyle(
//                            color: primary, fontSize: 13, letterSpacing: .3)),
//                  ],
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
}
