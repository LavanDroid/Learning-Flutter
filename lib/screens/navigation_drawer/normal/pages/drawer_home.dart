import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import '../widget/navigation_drawer.dart';

class DrawerHome extends StatefulWidget {

  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> with AppBase {
  late final BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Container(
      // child: widget.drawerStyle == 1 ? buildNormalAppBar() : buildFoldableAppBar(),
      child: buildNormalAppBar(),
    );
  }

  Widget buildNormalAppBar() => Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          title: const Text('Drawer Home'),
        ),
        drawer: buildNormalDrawer(),
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

  Widget buildNormalDrawer() => SizedBox(
      width: getScreenWidth(mContext) * 0.75, // 75% of screen will be occupied
      child: NavigationDrawer());

  Widget buildBack() => ElevatedButton(
        onPressed: () {
          Navigator.pop(mContext);
        },
        child: const Text('Go Back!'),
      );
}
