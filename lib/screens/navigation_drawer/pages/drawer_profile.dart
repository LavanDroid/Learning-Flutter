import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/navigation_drawer/widget/navigation_drawer.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        drawer: NavigationDrawer(),
        body: const Center(
          child: Text('This is drawer profile page'),
        ),
      );
}
