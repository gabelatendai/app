import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fwf/models/Updates.dart';
import 'package:fwf/pages/DetailedUpdate.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:fwf/widgets/CircularProgress.dart';
import 'package:http/http.dart' as http;
class UpadatesPage extends StatefulWidget {
  @override
  _UpadatesPageState createState() => _UpadatesPageState();
}

class _UpadatesPageState extends State<UpadatesPage> {
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  List<Updates>_Prolist = [];

  Future <Updates>getProducts() async {
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
          _Prolist.add(Updates.fromJson(i));
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
      body:Column(
        children: <Widget>[

         Container(

           child:  Image.asset('assets/img.png',),
         ),

          Expanded(
              child:
          FutureBuilder(
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
                       Updates pro= snapshot.data[index];
                       return InkWell(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => DetailedUpdate(
                                   title: pro.title,
                                   date: pro.date,
                                   id: pro.id,
                                   description: pro.description,
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
                                         Text(pro.date,
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
                                           Icons.note,
                                           color: secondary,
                                           size: 20,
                                         ),
                                         SizedBox(
                                           width: 5,
                                         ),
                                         Text(pro.description.length <= 40 ? pro.description : pro.description.substring(0, 40),
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
         ))
        ],

      )
    );


  }
}

Updates products;

Future<List<Updates>> fetchProducts() async{
  String url ="http://weddinghub.co.zw/fetch.php?updates=updates";
  final response = await http.get(url);
  return updatesFromJson(response.body);

}