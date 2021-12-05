import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/constants/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AppBase {
  late BuildContext mContext;
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
        //backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(AppImages.bgSplash)));
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {}).then(
      (value) => navigateToReplace(mContext, AppRoutes.home),
    );
  }
}
