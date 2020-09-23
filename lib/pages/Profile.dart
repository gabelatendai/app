import 'package:flutter/material.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLogin = false;
  _checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = (pref.get('isLogin') ?? false);
    setState(() {
      _isLogin = isLogin;
    });
    print('prefs $isLogin');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
    if(_isLogin==false){
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body:Center(
      child: Text('Welcome User'),
    ));
  }
}
