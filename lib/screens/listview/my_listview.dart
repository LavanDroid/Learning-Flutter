import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/screens/listview/refresh/refresh.dart';

import 'list_builder/my_list_builder.dart';
import 'search/my_search_list.dart';
import 'separated/my_separated.dart';
import 'simple/my_simple_list.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> with AppBase {
  /* final mTabScreen = [
    const MySimpleList(),
    const MyListBuilder(),
    const MySeparated(),
    const MySearchList()
  ]; */
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
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
              children: [
                MySimpleList(),
                MyListBuilder(),
                MySeparated(),
                MySearchList(),
                MyPullToRefresh(),
                // ...mTabScreen.map(Widget widget){}.toList(),
              ],
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
        isScrollable: true,
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
          Tab(
            text: 'Search',
          ),
          Tab(
            text: 'Pull To Refresh',
          ),
        ],
      ),
    );
  }
}
