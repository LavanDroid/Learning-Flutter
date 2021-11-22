// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_appbar/base_appbar.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key}) : super(key: key);
  //static const String routeName = '/MyButtons';

  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: "Buttons",
        whereFrom: "Veera",
        menuItem: [
          IconButton(
            icon: const Icon(Icons.verified_user),
            onPressed: () {
              print('Clicked Shield');
            },
          ),
          ElevatedButton(
            onPressed: () {
              print('Clicked Save');
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: const Color(0xff6200ee),
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.transparent)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back!')),
            ],
          ),
        ),
      ),
    );
  }
}
