import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/constants/app_route.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with AppBase {
  late final BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Container(
      child: buildAppBar(),
    );
  }

  Widget buildAppBar() => Scaffold(
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Navigation Drawer',
        ),
        body: Center(
          child: Column(
            children: [
              buildButton('Normal', 1),
              buildButton('Foldable', 2),
            ],
          ),
        ),
      );

  Widget buildButton(String text, int idx) => Container(
        margin: const EdgeInsets.fromLTRB(0, 25, 0, 8),
        child: ElevatedButton(
          onPressed: idx == 2
              ? null
              : () {
                  navigateTo(mContext, AppRoutes.drawerHome);
                },
          child: Text(
            text,
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            textStyle: const TextStyle(fontSize: 22.0),
          ),
        ),
      );
}
