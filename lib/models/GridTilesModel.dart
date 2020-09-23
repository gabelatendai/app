
import 'package:flutter/material.dart';
import 'package:fwf/pages/DetailedTeaching.dart';

class GridTilesModel extends StatelessWidget {
  String id;
  String title;
  String category;
  String name;
  String description;
  String date;
  String profile;
  String vedio;

  GridTilesModel(
      {Key key,
        @required this.id,
        @required this.vedio,
        @required this.profile,
        @required this.title,
        @required this.name,
        @required this.category,
        @required this.description,
        @required this.date,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedTeaching(video: vedio,
                title: title,name: name, date: date,
                profile: profile, id: id,
                description: description,
                category: category,)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            elevation: 0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child:Image.network(
                      profile,
                    width: 250,
                    height: 250,
                    ),),
                  Container(
//                    alignment: Alignment.center,
                   // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                        (title.length <= 20 ? title : title.substring(0, 20)),
                       // textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
//                    alignment: Alignment.bottomLeft,
//                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text("by ${name}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
//
//import 'package:flutter/material.dart';
//
//class GridTilesModel extends StatelessWidget {
//  String id;
//  String vidio;
//  String profile;
//  String date;
//  String title;
//  String category;
//  String description;
//  String name;
//  bool fromSubProducts = false;
//
//  GridTilesModel(
//      {Key key,
//      @required this.name,
//      @required this.profile,
//      @required this.id,
//      @required this.category,
//      @required this.date,
//      @required this.title,
//      @required this.vidio,
//      @required this.description,
////      @required this.date,
//     // @required this.qnty,
//
//      this.fromSubProducts})
//      : super(key: key);
////  String user_id;
////  Future _checkUserId() async{
////    SharedPreferences pref = await SharedPreferences.getInstance();
////    if(pref.getString("id")!=null){
////      //   setState(() {
////      user_id= pref.getString('id');
////      //   });
////    }
////  }
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: () {
//        /* if (fromSubProducts) {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => ProductsScreen(
//                      slug: "products/?page=1&limit=12&category=" + slug,
//                      name: name,
//                    )),
//          );
//        } else {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => SubCategoryScreen(
//                      slug: slug,
//                    )),
//          );
//        }*/
////        Navigator.push(
////          context,
////          MaterialPageRoute(
////              builder: (context) => ProductDetail(
////                id:id,
////                name:name,
////                ptype:ptype,
////                price:price,
////                pid:pid,
////                image:image, quantity: 1,
////             //   name:name,
////                //quantity: 4,
////               // user_id:user_id ,
////              )),
////        );
//      },
//      child: Container(
//        padding: EdgeInsets.only(top: 5),
//        child: Card(
//            color: Colors.white,
//            shape: RoundedRectangleBorder(
//              borderRadius: const BorderRadius.all(
//                Radius.circular(8.0),
//              ),
//            ),
//            elevation: 0,
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  Expanded(
//                    child:Image.network(
//                    profile,
////                    width: 150,
////                    height: 150,
//                  ),),
//                  Container(
//                    alignment: Alignment.center,
//                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//                    child: Text(
//                        (name.length <= 40 ? name : name.substring(0, 40)),
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                            color: Color(0xFF444444),
//                            fontFamily: 'Roboto-Light.ttf',
//                            fontSize: 15,
//                            fontWeight: FontWeight.w400)),
//                  ),
//                  Container(
//                    alignment: Alignment.bottomLeft,
//                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//                    child: Text("\$${(title )}",
//                        style: TextStyle(
//                            color: (title != null)
//                                ? Color(0xFFf67426)
//                                : Color(0xFF0dc2cd),
//                            fontFamily: 'Roboto-Light.ttf',
//                            fontSize: 20,
//                            fontWeight: FontWeight.w500)),
//                  )
//                ],
//              ),
//            )),
//      ),
//    );
//  }
//}
