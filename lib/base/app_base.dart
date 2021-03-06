import 'package:flutter/material.dart';
import 'package:flutter_demo/model/bundle.dart';

import 'app_extension.dart';

class AppBase {
  late var appPrint = AppPrint();
  late var appErrorPrint = AppErrorPrint();
  late var showToast = ShowToast();
  late var hideKeyBoard = HideKeyBoard();
  late var validateEmail = ValidateEmail();
  late var validatePassword = ValidatePassword();
  late var validateMobile = ValidateMobile();

  // ? This method can use, but i hide
  // void myDummyMethod();

  ///? Move to the next page, remain the stack
  // navigateTo(BuildContext mContext, String routePage, AppBundle? data) {
  navigateTo(BuildContext mContext, String routePage, {AppBundle? bundle}) {
    if (bundle != null) {
      Navigator.pushNamed(mContext, routePage, arguments: bundle);
    } else {
      Navigator.pushNamed(mContext, routePage);
    }
  }

  ///? Move to the next page, replaces the current page,
  ///? but still remain the stack
  navigateToReplace(BuildContext mContext, String routePage,
      {AppBundle? bundle}) {
    if (bundle != null) {
      Navigator.pushReplacementNamed(mContext, routePage, arguments: bundle);
    } else {
      Navigator.pushReplacementNamed(mContext, routePage);
    }
  }

  ///? Move to the next/preview page, clear all stack
  /* navigateToRemoveUntil(BuildContext mContext, String routePage,
      {String data = ''}) {
    if (data.isNotEmpty) {
      Navigator.pushAndRemoveUntil(mContext, routePage, arguments: data, (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(mContext, routePage, (route) => false);
    }
  } */

  getScreenWidth(BuildContext mContext) {
    return MediaQuery.of(mContext).size.width;
  }

  getScreenHeight(BuildContext mContext) {
    return MediaQuery.of(mContext).size.height;
  }
}
