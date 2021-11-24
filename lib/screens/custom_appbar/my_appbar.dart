import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  //static const String routeName = '/MyAppBar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: "My Custom AppBar",
      ),
    );
  }
}
