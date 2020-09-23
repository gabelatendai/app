import 'package:flutter/material.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:provider/provider.dart';
import '../AppSignIn.dart';
import '../validation/signup_validation.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController  name=new TextEditingController();
  TextEditingController  email=new TextEditingController();
  TextEditingController  password=new TextEditingController();
     TextEditingController  address=new TextEditingController();
  TextEditingController  mobile=new TextEditingController();

  void addData(){
    var url="http://weddinghub.co.zw/fif/adddata.php";
      http.post(url,body: {
        "name":name.text,
        "email":email.text,
        "password":password.text,
        "phone":mobile.text,
        "address":address.text,
    });
    showDialog(context: context, builder: (_) => feedBack());
  }
  @override
  //List<Cities> _cities= [];
  String dropdown;

  var loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object');
  }
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    TextStyle textStyle = Theme.of(context).textTheme.title;
//    final validService = Provider.of<SignupValidation>(context);
    final validService= Provider.of<SignupValidation>(context);
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      appBar: appBarWidget(context),
      resizeToAvoidBottomInset: false,
      body:   ListView(
        padding: EdgeInsets.only(top: 100.0),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: new TextField(
                            controller: name,
                            showCursor: true,
                            decoration: InputDecoration(
                              errorText: validService.firstName.error,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                              ),
                              hintText: "Full Name",
                            ),
                            onChanged: (String value) {
                              validService.changeFirstName(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: email,
                            //

                            onChanged: (String value) {
                              validService.validateEmail(value);
                            },
                            keyboardType: TextInputType.emailAddress,
                            showCursor: true,
                            decoration: InputDecoration(
                              errorText: validService.email.error,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                              ),
                              hintText: "Email",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // new SizedBox(height: ScreenUtil().setHeight(20.0)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: new Row(
                        children: <Widget>[

                          // new SizedBox(width: ScreenUtil().setWidth(20.0)),
                          new Expanded(
                            flex: 5,
                            child: new  TextField(
                              onChanged: (String value) {
                                validService.validateMobile(value);
                              },

                              controller: mobile,
//                   onChanged: (value){
//                     this.phoneNo=value;
//                   },
                              keyboardType: TextInputType.phone,
                              showCursor: true,
                              decoration: InputDecoration(
                                errorText: validService.mobile.error,
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
                                hintText: "Phone Number",

                              ),
                            ),)
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: address,
                      onChanged: (String value) {
                        validService.validateAddress(value);
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        errorText: validService.address.error,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.info_outline,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Address",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: password,
                      onChanged: (String value) {
                        validService.validatePassword(value);
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        errorText: validService.password.error,
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
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        //child: Text('Submit'),
                        onPressed:  (!validService.isValid) ? null:
                            ()=>{},
                        // addData(),
                        padding: EdgeInsets.all(17.0),
                        child: Text(
                          "Sign Up",
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
                            side: BorderSide(color: Colors.purple)),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),


    );
  }

}
class feedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: Container(
          color: Colors.purple,
          padding: EdgeInsets.all(50),
          width: width * 0.90,
          height: height * 0.7,
          child: Column(
            children: <Widget>[
              Container(
                  height: height * 0.15,
                  child: Image.asset('assets/cc.png')),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Registration was successful !',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Cabin', color: Colors.white),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "We're glad you're here! Before you start exploring we just send you email confirmation."
                    "Click on the Link to confirm your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontFamily: 'OpenSans', color: Colors.white),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(110, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff17202A),
                      ),
                      child: Text(
                        "Got it",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      print('object');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppSignIn()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
