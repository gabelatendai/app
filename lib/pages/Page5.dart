import 'package:flutter/material.dart';
import 'package:fwf/models/about.dart';
import 'package:fwf/widgets/CircularProgress.dart';
import 'package:http/http.dart' as http;

import 'H.dart';


class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  var titleTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  var loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String g = ('${now.year}/ ${now.month}/ ${now.day}');
    return Scaffold(
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
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (BuildContext context, int index) {
                          About products= snapshot.data[index];
                          return  InkWell(
                              onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  H(
                                    name: products.name,
                                    title: products.title,
                                    profile:'https://weddinghub.co.zw/fif/uploads/listings/${products.profile}',
                                    description: products.description,
                                    id: products.id,
                                    // name: products.name,
                                  )),
                                );
                              },
                              child: Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage('https://weddinghub.co.zw/fif/uploads/listings/${products.profile}'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            products.name,
                                            //fifmidubai.online.church
                                            style: titleTextStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                products.title,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                g.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          );


                        });
                  }
                }
            )
        )
    );


  }
}

About products;

Future<List<About>> fetchProducts() async{
  String url ="http://weddinghub.co.zw/fetch.php?about=about";
  final response = await http.get(url);
  return aboutFromJson(response.body);

}