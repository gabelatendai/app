
import 'package:fwf/pages/question.dart';
import 'package:fwf/pages/Page2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fwf/pages/Page3.dart';
import 'package:fwf/pages/Page4.dart';
import 'package:fwf/pages/Page5.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:fwf/widgets/DrawerWidget.dart';

class QuizHomePage extends StatefulWidget {
  @override

  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int _currentIndex = 0;
  final tabs= [
    MyHomePage(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];
  final List<Color> tileColors = [
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.pink,
  Colors.indigo,
  Colors.lightBlue,
  Colors.amber,
  Colors.deepOrange,
  Colors.red,
  Colors.brown
];
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:appBarWidget(context),
        drawer: DrawerWidget(),
        body: tabs[_currentIndex],

      bottomNavigationBar:  BottomNavigationBar(
          currentIndex :_currentIndex,
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Color(0xFF545454)),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tv),
              title: Text(
                'Sermons',
                style: TextStyle(color: Color(0xFF545454)),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bible,),
              title: Text(
                'Bible',
                style: TextStyle(color: Color(0xFF545454)),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendarDay),
              title: Text(
                'Events',
                style: TextStyle(color: Color(0xFF545454)),
              ),
            ), BottomNavigationBarItem(
              icon:Icon( Icons.info_outline),
              title: Text(
                'About',
                style: TextStyle(color: Color(0xFF545454)),
              ),
            ),
          ],
          //currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFAA292E),
          onTap: (index){
            setState(() {
              _currentIndex = index;
              // navigateToScreens(index);
            });

          }

      ),
    );
  }
}
