// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppPrint {
  call(dynamic msg) {
    if (!AppConstants.inProduction) {
      //print('Veera : $msg -> ' + (AppConstants.inProduction.toString()));
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
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email.isEmpty) {
      return 'Enter an email';
    } else if (!regex.hasMatch(email) || email.toLowerCase().endsWith('.web')) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }
}

class ValidatePassword {
  call(String pwd) {
    /**
    * r'^
    (?=.*[A-Z])       // should contain at least one upper case
    (?=.*[a-z])       // should contain at least one lower case
    (?=.*?[0-9])          // should contain at least one digit
    (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
    {8,25}      // min-8 max-25
    $ */
    final RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,25}$');
    if (pwd.isEmpty) {
      return 'Enter a password';
    } else if (!regex.hasMatch(pwd)) {
      return 'Enter a valid password';
    } else {
      return null;
    }
  }
}

class ValidateMobile {
  call(String phone) {
    final RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

    if (phone.isEmpty) {
      return 'Enter mobile number';
    } else if (!regex.hasMatch(phone)) {
      return 'Enter a mobile number';
    } else {
      return null;
    }
  }
}
