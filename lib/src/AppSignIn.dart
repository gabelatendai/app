import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fwf/pages/Profile.dart';
import 'package:fwf/pages/Register.dart';
import 'package:fwf/pages/dialogs.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppSignIn extends StatefulWidget {
  @override
  _AppSignInState createState() => _AppSignInState();
}


class _AppSignInState extends State<AppSignIn> {
  bool isLogIn=false;
  bool invisible = true;

  String id ='';
  String name ='';
  TextEditingController  email=new TextEditingController();
  TextEditingController  password=new TextEditingController();
  String msg= '';
  Future _checkLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool("isLogIn")){
      setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen())
      );
      });
    }
  }
  _setIsLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isLogin', true);
  }
  Future<List> _login() async {
  final response = await http.post("http://weddinghub.co.zw/fif/applogin.php"
  , body: {
  "email": email.text,
  "password": password.text,
  });
  var datauser = json.decode(response.body);
  if (datauser.length == 0) {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool("isLogIn", false);
  setState(() {
  msg = 'Invalid User';
//    SnackBar snackaBar = SnackBar(content:
//    );
  });
  } else {
  if (datauser[0]["verified"] == "1") {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.setBool("isLogIn", true);
  _setIsLogin();
  await pref.setString('email', email.value.text);
  await pref.setString('id', datauser[0]["id"]);
  await pref.setString('name', datauser[0]["name"]);
  await pref.setString('address', datauser[0]["address"]);
  await pref.setString('mobile', datauser[0]["mobile"]);
//        _customAlertDialog(context, AlertDialogType.SUCCESS );
  Navigator.of(context).pop();
  } else {
  _customAlertDialog(context, AlertDialogType.WARNING );
  //    Navigator.of(context).pop();
  }
  setState(() {
  email = datauser[0]["email"];
  id = datauser[0]["id"];
  name = datauser[0]["name"];
  });
  }
  return datauser;
}
  void _toggleSignupConfirm() {
    setState(() {
      invisible= !invisible;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }
  @override
  Widget build(BuildContext context) {
//    final vs= Provider.of<LoginValidation>(context);
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child:ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.close),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
             Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 130,
                        height: 130,
                        alignment: Alignment.center,
                        child: Image.asset("assets/index.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
//                    onChanged: (String value) {
//                      vs.validateEmail(value);
//                    },
                        controller: email,
                        showCursor: true,
                        decoration: InputDecoration(
//                      errorText: vs.email.error,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          hintText: "Your Email",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
//                    onChanged: (String value) {
//                      vs.validatePassword(value);
//                    },
                        obscureText: invisible,
                        controller: password,
                        showCursor: true,
                        decoration: InputDecoration(
//                      errorText: vs.password.error,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _toggleSignupConfirm,
                            child: Icon(
                              Icons.remove_red_eye,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.purple),),

                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.all(17.0),
                          onPressed:
//                        (!vs.isValid) ? null:
                              ()=>{},
                                  // _login()

                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium.ttf',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              side: BorderSide(color:Colors.purple)),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
//                          MaterialPageRoute(builder: (context) => AppSingUp()),
                            )
                          },
                          child: Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.purple,
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],

        )

      ),
    );
  }
}

_customAlertDialog(BuildContext context, AlertDialogType type) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        type: type,
        title: "Email Confirmation",
        content: "Your need to confirm your email which was send to your email: ",
      );
    },
  );
}

