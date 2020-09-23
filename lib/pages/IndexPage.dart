import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fwf/models/category.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
//                    image: DecorationImage(image:
//                    AssetImage('assets/lp.png'), fit: BoxFit.cover)
                ),
                height: 200,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Text("Select a category to start ", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0
                    ),),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0
                      ),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: categories.length,

                      )

                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
Widget _buildCategoryItem(BuildContext context, int index) {
  Category category = categories[index];
  return MaterialButton(
    elevation: 1.0,
    highlightElevation: 1.0,
    onPressed: () =>{

     print(category.name.toString())
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Colors.purple,
    textColor: Colors.white70,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        Image.asset('assets/lp.png'),
        if(category.icon != null)
          Icon(category.icon),
        if(category.icon != null)
          SizedBox(height: 5.0),
        Text(
          category.name,
          textAlign: TextAlign.center,
          maxLines: 3,),
      ],
    ),
  );
}

final List<Category> categories = [
  Category(9,"Apostle's Update",'Apostle', icon: FontAwesomeIcons.globeAsia),
  Category(10,"Teachings",'Teachings', icon: FontAwesomeIcons.bookOpen),
  Category(11,"Watch Live",'Live' ,icon: FontAwesomeIcons.tv),
  Category(12,"Events",'Events', icon: FontAwesomeIcons.calendar),
  Category(13,"Connect", 'Connect',icon: FontAwesomeIcons.theaterMasks),
  Category(14,"Bible", 'Bible',icon: FontAwesomeIcons.bible),
//  Category(15,"Video Games","Video Games", icon: FontAwesomeIcons.gamepad),
//  Category(16,"Board Games","Board Games", icon: FontAwesomeIcons.chessBoard),
//  Category(17,"Science & Nature","Science & Nature", icon: FontAwesomeIcons.microscope),
//  Category(18,"Computer","Computer", icon: FontAwesomeIcons.laptopCode),
//  Category(19,"Maths","Maths", icon: FontAwesomeIcons.sortNumericDown),
//  Category(21,"Sports","Sports", icon: FontAwesomeIcons.footballBall),
//  Category(22,"Geography","Geography", icon: FontAwesomeIcons.mountain),
//  Category(23,"History","History", icon: FontAwesomeIcons.monument),
//  Category(25,"Art","Art", icon: FontAwesomeIcons.paintBrush),
//  Category(27,"Animals","Animals", icon: FontAwesomeIcons.dog),
//  Category(28,"Vehicles","Vehicles", icon: FontAwesomeIcons.carAlt),
//  Category(30,"Gadgets","Gadgets", icon: FontAwesomeIcons.mobileAlt),
];
