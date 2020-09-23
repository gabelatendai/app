import 'package:flutter/material.dart';
import './validation_item.dart';


class SignupValidation with ChangeNotifier {

  ValidationItem _firstName = ValidationItem(null,null);
  ValidationItem _email = ValidationItem(null,null);
  ValidationItem _mobile = ValidationItem(null,null);
  ValidationItem _password = ValidationItem(null,null);
  ValidationItem _address = ValidationItem(null,null);

  //Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get email => _email;
  ValidationItem get mobile => _mobile;
  ValidationItem get password => _password;
  ValidationItem get address => _address;
  bool get isValid {
    if (_email.value != null && _firstName.value!= null && mobile.value != null && password.value != null && address.value != null){
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeFirstName(String value){
    if (value.length >= 3){
      _firstName=ValidationItem(value,null);
    } else {
      _firstName=ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      _email=ValidationItem(null, "Enter Valid Email");

    } else {
      _email = ValidationItem(value, null);
    }
    notifyListeners();
  }
  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10) {
      _mobile = ValidationItem(null, "Mobile Number must be of 10 digit");
      //  return '';
    } else {
      _mobile = ValidationItem(value, null);

    }
    notifyListeners();
  }


  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      _password=ValidationItem(null, "Please enter password");
    } else {
      if (!regex.hasMatch(value)) {
        _password = ValidationItem(null, "Enter valid password which includes mixed characters");
      } else{
        _password = ValidationItem(value, null);
      }
      notifyListeners();
    }
  }
  String validateAddress(String value) {
    if (value.isEmpty) {
      _address=ValidationItem(null, "Please enter address");
    } else {
      _address = ValidationItem(value, null);
    }
      notifyListeners();

  }

  void send(){
       print("FirstName: ${firstName.value}, Email: ${email.value}, Address:  ${address.value}, Mobile:  ${mobile.value}");

  }
}