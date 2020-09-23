import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fwf/models/GridTilesModel.dart';
import 'package:fwf/models/Model.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:fwf/widgets/CircularProgress.dart';
import 'package:http/http.dart' as http;
class Teachings extends StatefulWidget {
  @override
  _TeachingsState createState() => _TeachingsState();
}

class _TeachingsState extends State<Teachings> {

  List<Model>_Prolist = [];

  Future <Model>getProducts() async {
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
          _Prolist.add(Model.fromJson(i));
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
                  return  GridView.builder(
                      itemCount:snapshot.data.length,
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        Model products= snapshot.data[index];
                        return
                          GridTilesModel(
                          name: products.name,
                          id: products.id,
                          title: products.title,
                          profile: "http://weddinghub.co.zw/fif/uploads/listings/${products.profile}",
                          description:products.description,
                          vedio:'https://weddinghub.co.zw/fif/uploads/videos/${products.vidio}',
                            category: products.category,
                            date: products.date,
//                            date: products.date,
                        );
                      });
                }
              }
          )
      )
    );


  }
}

Model products;

Future<List<Model>> fetchProducts() async{
  String url ="https://weddinghub.co.zw/fetch.php?teachings=teachings";
  final response = await http.get(url);
  return modelFromJson(response.body);

}