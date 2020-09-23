import 'package:flutter/material.dart';
import 'package:fwf/src/screens/signup.dart';
import 'package:fwf/src/validation/signup_validation.dart';
import 'package:provider/provider.dart';

 class Register extends StatefulWidget {
   @override
   _RegisterState createState() => _RegisterState();
 }

 class _RegisterState extends State<Register> {
   @override
   Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create: (context) => SignupValidation(),
       child: Signup(),

     );
   }
 }
