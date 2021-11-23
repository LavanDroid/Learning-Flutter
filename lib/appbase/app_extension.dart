// ignore_for_file: avoid_print

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
