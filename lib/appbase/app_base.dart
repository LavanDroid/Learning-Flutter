import 'package:flutter_demo/appbase/app_colors.dart';
import 'package:flutter_demo/appbase/app_extension.dart';

abstract class AppBase {
  late var appPrint = AppPrint();
  late var appColor = AppColors();
  late var showToast = ShowToast();
  late var hideKeyBoard = HideKeyBoard();
  late var validateEmail = ValidateEmail();
  late var validatePassword = ValidatePassword();
  late var validateMobile = ValidateMobile();

  // ? This method can use, but i hide
  // void myVeeraMethod();
}
