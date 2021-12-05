import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_image.dart';

import 'common_appbar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  //static const String routeName = '/MyAppBar';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        icon: AppImages.icCustomBack,
        title: "My Custom AppBar",
      ),
    );
  }
}
