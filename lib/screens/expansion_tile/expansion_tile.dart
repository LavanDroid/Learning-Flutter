import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyExpansionTile extends StatefulWidget {
  const MyExpansionTile({Key? key}) : super(key: key);

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> with AppBase {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildAppBar(),
    );
  }

  Widget buildAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: const CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'Expansion Tile',
          ),
          body: buildExpansionScreen(),
        ),
      );

  Widget buildExpansionScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25.0),
                  buildExpansionTileOne(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildExpansionTileOne() => ExpansionTile(
        title: const Text(
          'See more',
          style: TextStyle(fontSize: 22.0, color: Colors.black),
        ),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.amber,
        children: [
          ListTile(
            title: const Text('First'),
            //tileColor: Colors.red,
            onTap: () => showToast('First'),
          ),
          ListTile(
            title: const Text('Second'),
            //tileColor: Colors.red,
            onTap: () => showToast('Second'),
          ),
          ListTile(
            title: const Text('Third'),
            //tileColor: Colors.red,
            onTap: () => showToast('Third'),
          ),
        ],
      );
}
