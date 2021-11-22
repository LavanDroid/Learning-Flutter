import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_appbar/base_appbar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  //static const String routeName = '/MyAppBar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: "My Custom AppBar",
      ),
    );
  }
}
