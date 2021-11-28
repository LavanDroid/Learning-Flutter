import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

import 'textfield_border.dart';
import 'textfield_focus.dart';
import 'textfield_general.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> with AppBase {
  int index = 0;

  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: const CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'Text Field (EditText)',
          ),
          body: buildScreen(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: Colors.red,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                icon: Text('TextField'),
                label: 'General',
              ),
              BottomNavigationBarItem(
                icon: Text('TextField'),
                label: 'Borders',
              ),
              BottomNavigationBarItem(
                icon: Text('TextField'),
                label: 'Focus',
              ),
            ],
            onTap: (int index) => setState(() => this.index = index),
          ),
        ),
      );

  Widget buildScreen() {
    switch (index) {
      case 0:
        return const TextFieldGeneral();
      case 1:
        return const TextFieldBorder();
      case 2:
        return const TextFieldFocus();
      default:
        return Container();
    }
  }
}
