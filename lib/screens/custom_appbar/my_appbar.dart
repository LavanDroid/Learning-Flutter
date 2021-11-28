import 'package:flutter/material.dart';

import 'common_appbar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  //static const String routeName = '/MyAppBar';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: "My Custom AppBar",
      ),
    );
  }
}
