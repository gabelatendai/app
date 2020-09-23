import 'package:flutter/material.dart';

import 'Bible.dart';
import 'Connect.dart';
import 'EventsPage.dart';
import 'LiveMenu.dart';
import 'PageR.dart';
import 'Teachings.dart';
import 'Updates.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment(0.0,-.4),
                height: 100,
                color: Colors.white,
                child: Text(
                  "Forward In Faith Abu Dhabi ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 90, 25, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.grey,
                      ),
                    ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 25, 5, 5),
                          child: Text(
                            "Lets Connect".toUpperCase(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 45, 5, 25),
                          child: Text('201',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            print("clicked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageR()),
//
                            );
                          },
                          child: Text("Find More",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(right: 25,left:25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Events',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                  ),
                ),
                Text(
                  'Watch Live',
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: <Widget>[
              _buildCard('Apostles Update','Get the latest news ','assets/b.jpg', 1),
              _buildCard('Teachings','Indulge into the world of God','assets/a.jpg', 2),
              _buildCard('Watch Live', 'Enjoy the Live streaming' ,'assets/img2.png',3),
              _buildCard('Events','Watch out on whats coming ','assets/5.png', 4),
              _buildCard('Connect', 'Join one of our Assemblies','assets/c.jpg', 5),
              _buildCard('Bible','Dive into the word of God','assets/e.png', 6)
            ],
          ),
        ],
      ),
    );

  }

  Widget _buildCard(String name,String msg,String img,int cardIndex)
  {
    return InkWell(
        onTap: () {
          print(name);
          if (name=="Watch Live"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LiveMenu()),
            );
          }
          if (name=="Bible"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Bible()),
          );
          }
          if (name=="Connect"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ConnectPage()),
          );
          }
          if (name=="Apostles Update"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  UpadatesPage()),
          );
          }
          if (name=="Teachings"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Teachings()),
          );
          }
          if (name=="Events"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  EventsPage()),
          );
          }
        },
      child:  Card(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          elevation: 7.0,
          child: Column(
            children: <Widget>[
//                  SizedBox(height: 12.0),
              Image.asset(img,),

              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: 175,
                  height: 100,
                  decoration: BoxDecoration(
                      color:
                      Colors.purple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                  ),

                    child: Center(
                      child:
                      Text(msg,
                        style: TextStyle(color: Colors.white),),

                  ),
                ),
              )
            ],
          ),
          margin: cardIndex.isEven?EdgeInsets.fromLTRB(10.0, 0, 25.0,10.0):
          EdgeInsets.fromLTRB(25.0, 0, 5.0,10.0)
      ),
    );

  }
}
