import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/widget/navigation_drawer.dart';

class DrawerEvent extends StatelessWidget {
  const DrawerEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        drawer: NavigationDrawer(),
        body: const Center(
          child: Text('This is drawer event page'),
        ),
      );
}
