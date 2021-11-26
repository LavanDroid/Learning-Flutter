import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> with AppBase {
  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'ListView',
          ),
          body: buildListScreen(),
        ),
      );

  Widget buildListScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                /* children: [
                  const SizedBox(height: 25.0),
                  buildCallDialog(),
                  const SizedBox(height: 25.0),
                ], */
              ),
            ),
          ),
        ),
      );
}
