import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/navigation_drawer/widget/navigation_drawer.dart';

class DrawerNotification extends StatelessWidget {
  const DrawerNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        drawer: NavigationDrawer(),
        body: const Center(
          child: Text('This is drawer notification page'),
        ),
      );
}
