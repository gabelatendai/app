import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fwf/models/connect.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:fwf/widgets/CircularProgress.dart';
import 'package:http/http.dart' as http;

import 'DetailedConnect.dart';
class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
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
    String urldata ="https://weddinghub.co.zw/fetch.php";
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
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
fetchProducts();
getProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
      body:Container(
       child:   FutureBuilder(
              future: fetchProducts(),
              builder: (context,snapshot){
                if(snapshot.data==null){
                  return Container(
                    child:  CircularProgress(),
                  );
                  //child: Products(),
                }else{
                  return  ListView.builder(
                      itemCount:snapshot.data.length,

                      itemBuilder: (BuildContext context, int index) {
                        Connect pro= snapshot.data[index];
                        return  InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedConnect(
                                    title: pro.title,
                                    date: pro.date,
                                    id: pro.id,
                                    profile:pro.profile,
                                    location:pro.location,
                                    description: pro.description,
                                    contact: pro.contact,
                                  )),
                            );
                          },
                          child: Container(
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
                                        image:NetworkImage("http://weddinghub.co.zw/uploads/listings/${pro.profile}"),
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
                          ),
                        );
                      });
                }
              }
          )
      )
    );


  }
}

Connect products;

Future<List<Connect>> fetchProducts() async{
  String url ="http://weddinghub.co.zw/fetch.php?connect=connect";
  final response = await http.get(url);
  return connectFromJson(response.body);

}