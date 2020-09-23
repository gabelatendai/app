import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fwf/pages/PageR.dart';
import 'package:fwf/pages/Profile.dart';
import 'package:fwf/pages/Register.dart';
import 'package:fwf/pages/question.dart';
import 'package:fwf/src/AppSignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String name = "";
  String msg ='Please Login';
  String txt ='Sign In';
  String log ='Register';
  bool _isLogin = false;
  _checkLogin2() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = (pref.get('isLogin') ?? false);
    setState(() {
      _isLogin = isLogin;
    });
    print('prefs $isLogin');
  }
  Future _checkLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool("isLogIn")!=false){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppSignIn())
      );
    }else{
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen())
      );
    }
  }
  _reg() async{
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register())
    );
    print('2');
  }
  _out() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    print('1');
    _LogOut();

  }
  _setLogOut() async {
    ! _isLogin ?
    _reg():_out();
  }
  Future _LogOut() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLogIn",false);
    // _setLogOut();
    pref.setString("name",null);
    pref.setString("id",null);
    pref.setString("email",null);
    pref.setString("mobile",null);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
  Future _checkUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("name") != null) {
      setState(() {
        name = pref.getString('name');
        msg=" Welcome :";
        txt=" Profile";
        log="Sign Out";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin2();
    _checkUser();

  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),

            _createDrawerItem(
                icon: Icons.share,
                text: 'FIFMI Abu DHABI',
                onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LogPage()),
// //
//                   );
                }
                ),
//             _createDrawerItem(
//                 icon: Icons.people_outline,
//                 text: 'Account',
//                 onTap: () {
// //                    Navigator.push(
// //                      context,
// //                      MaterialPageRoute(builder: (context) => Register()),
// // //                      MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
// //                    );
//                 }
//                 ),
            _createDrawerItem(
                icon: Icons.call,
                text: 'Contact Us',
                onTap: () =>{
                //   Navigator.push(
                // context,
                // MaterialPageRoute(
                // builder: (context) => AppSignIn()),
                // )
            }),

                    _createDrawerItem(
                icon: Icons.info_outline,
                text: 'About Us',
                onTap: () =>{ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageR()),
                )}

      ),
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: txt,
                onTap: () =>
                   _checkLogin()
            ),
            _createDrawerItem(
                icon: Icons.lock_open,
                text: log,
                onTap: () {
                  //_LogOut();

                 _setLogOut();
                },
            ),
            // Text('gabriel musodza')
          ],
        ),
      ),
    );
  }


  Widget _createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Image.asset(
                'assets/index.png',
                width: 130,
                height: 130,
              ),
            ),
          ),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("$msg  $name",
                  style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color(0xFF808080),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              text,
              style: TextStyle(color: Color(0xFF484848)),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}