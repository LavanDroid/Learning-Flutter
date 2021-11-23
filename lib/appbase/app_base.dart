
import 'package:flutter_demo/appbase/app_colors.dart';
import 'package:flutter_demo/appbase/app_extension.dart';

abstract class AppBase {
  late var appPrint = AppPrint();
  late var appColor = AppColors();
  late var showToast = ShowToast();

  // ? This method can use, but i hide
  // void myVeeraMethod();
}
