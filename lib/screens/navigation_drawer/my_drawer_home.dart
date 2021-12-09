import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import 'widget/navigation_drawer.dart';

class DrawerHome extends StatelessWidget {
  final AppBase appBase = AppBase();
  late final BuildContext mContext;

  DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Container(
      child: buildAppBar(),
    );
  }

  Widget buildAppBar() => Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          title: const Text('Navigation Drawer'),
        ),
        drawer: buildDrawer(),
        body: Center(
          child: Column(
            children: [
              const Text('This is drawer home page'),
              const SizedBox(
                height: 25.0,
              ),
              buildBack(),
            ],
          ),
        ),
      );

  Widget buildDrawer() => SizedBox(
      width: appBase.getScreenWidth(mContext) *
          0.75, // 75% of screen will be occupied
      child: NavigationDrawer());

  Widget buildBack() => ElevatedButton(
        onPressed: () {
          Navigator.pop(mContext);
        },
        child: const Text('Go Back!'),
      );
}
