import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';

import 'advance.dart';
import 'basic.dart';

class MyDateAndTime extends StatefulWidget {
  const MyDateAndTime({Key? key}) : super(key: key);

  @override
  _MyDateAndTimeState createState() => _MyDateAndTimeState();
}

class _MyDateAndTimeState extends State<MyDateAndTime> with AppBase {
  int index = 0;

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Date And Time',
        ),
        body: buildPage(),
        bottomNavigationBar: buildBottomBar(),
      );

  Widget buildPage() => SafeArea(
        child: Center(
          child: buildScreen(),
        ),
      );

  Widget buildBottomBar() => BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: index,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        items: const [
          BottomNavigationBarItem(
            icon: Text('DatePicker', style: TextStyle(color: Colors.white)),
            label: 'Basic',
          ),
          BottomNavigationBarItem(
            icon: Text('DatePicker', style: TextStyle(color: Colors.white)),
            label: 'Advanced',
          ),
        ],
        onTap: (int index) => setState(() => this.index = index),
      );

  Widget buildScreen() {
    switch (index) {
      case 0:
        return const DateTimeBasic();
      case 1:
        return const DateTimeAdvance();
      default:
        return Container();
    }
  }
}
