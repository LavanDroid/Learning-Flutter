import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/screens/listview/list_builder/my_list_builder.dart';
import 'package:flutter_demo/screens/listview/separated/my_separated.dart';
import 'package:flutter_demo/screens/listview/simple/my_simple_list.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> with AppBase {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        backgroundColor: appColor.mGrey,
        appBar: const CommonAppBar(
          icon: 'assets/images/ic_custom_back.png',
          title: 'ListView',
        ),
        body: buildListScreen(),
      );

  Widget buildListScreen() => SafeArea(
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: GestureDetector(
            onTap: () => hideKeyBoard(),
            child: const TabBarView(
              children: [MySimpleList(), MyListBuilder(), MySeparated()],
            ),
          ),
        ),
      );

  Widget menu() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: const TabBar(
        labelColor: Colors.white,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.orange,
        isScrollable: false,
        tabs: [
          Tab(
            text: 'Simple',
            //icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            text: 'Builder',
          ),
          Tab(
            text: 'Separated',
          ),
        ],
      ),
    );
  }
}
