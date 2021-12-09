import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/constants/app_route.dart';

class NavigationDrawer extends StatelessWidget {
  final AppBase appBase = AppBase();
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildDrawerHeader(),
            buildDrawerBodyItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  appBase.navigateToReplace(context, AppRoutes.drawerHome),
            ),
            buildDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () =>
                  appBase.navigateToReplace(context, AppRoutes.drawerProfile),
            ),
            buildDrawerBodyItem(
              icon: Icons.event_note,
              text: 'Events',
              onTap: () =>
                  appBase.navigateToReplace(context, AppRoutes.drawerEvent),
            ),
            const Divider(),
            buildDrawerBodyItem(
              icon: Icons.notifications_active,
              text: 'Notifications',
              onTap: () => appBase.navigateToReplace(
                  context, AppRoutes.drawerNotification),
            ),
            buildDrawerBodyItem(
              icon: Icons.contact_phone,
              text: 'Contact Info',
              onTap: () =>
                  appBase.navigateToReplace(context, AppRoutes.drawerContact),
            ),
            ListTile(
              title: const Text('App version 1.0.0'),
              onTap: () {},
            ),
          ],
        ),
      );

  Widget buildDrawerHeader() => DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.bgDrawerHeader))),
        child: Stack(
          children: const <Widget>[
            Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(
                "Welcome to Flutter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildDrawerBodyItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
