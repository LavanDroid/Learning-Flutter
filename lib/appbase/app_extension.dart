// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/api_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppPrint {
  call(dynamic msg) {
    if (!ApiConstants.inProduction) {
      //print('Veera : $msg -> ' + (ApiConstants.inProduction.toString()));
      print('$msg');
    }
  }
}

class ShowToast {
  call(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg);
  }
}

class HideKeyBoard {
  call() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  /* call(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  } */
}

class ValidateEmail {
  call(String email) {
    if (email.isNotEmpty) {
      final RegExp regex = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(email) || email.toLowerCase().endsWith('.web')) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    } else {
      return 'Please enter email address';
    }
  }
}

class ValidatePassword {
  call(String pwd) {
    if (pwd.isNotEmpty) {
      final RegExp regex = RegExp(
          /**
           * r'^
            (?=.*[A-Z])       // should contain at least one upper case
            (?=.*[a-z])       // should contain at least one lower case
            (?=.*?[0-9])          // should contain at least one digit
            (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
            {8,25}      // min-8 max-25
            $ */
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,25}$');
      if (!regex.hasMatch(pwd)) {
        return 'Please enter valid password';
      } else {
        return null;
      }
    } else {
      return 'Please enter password';
    }
  }
}

class ValidateMobile {
  call(String phone) {
    if (phone.isNotEmpty) {
      final RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
      if (!regex.hasMatch(phone)) {
        return 'Please enter valid mobile number';
      } else {
        return null;
      }
    } else {
      return 'Please enter mobile number';
    }
  }
}
