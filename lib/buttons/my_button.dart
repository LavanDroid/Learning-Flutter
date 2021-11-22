// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/custom_appbar/base_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key}) : super(key: key);
  //static const String routeName = '/MyButtons';

  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> with AppBase {
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
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                'Elevate Button',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () => {
                        //appPrint('Button 1'),
                        Fluttertoast.showToast(msg: "Button 1")
                      },
                  child: const Text('Button 1')),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                'Text Button',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationColor: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextButton(
                onPressed: () => appPrint('Click Me'),
                child: const Text(
                  'Click Me',
                  style: TextStyle(fontSize: 20.0, color: Colors.pinkAccent),
                ),
              ),
              TextButton(
                onPressed: () => appPrint('Button 2'),
                child: const Text(
                  'Button 2',
                  style: TextStyle(fontSize: 25.0),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.greenAccent,
                    backgroundColor: Colors.purple),
              ),
              /* child: Text(
                  'Button 2',
                  style: 
                  (
                      fontSize: 20.0,
                      color: Colors.greenAccent,
                      backgroundColor: Colors.purple),
                ), 
              )),*/
            ],
          ),
        ),
      ),
    );
  }
}
