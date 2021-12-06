import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/screens/listview/refresh/gridview/grid_refresh.dart';
import 'package:flutter_demo/screens/listview/refresh/listview/list_refresh.dart';

class MyPullToRefresh extends StatefulWidget {
  const MyPullToRefresh({Key? key}) : super(key: key);

  @override
  _MyPullToRefreshState createState() => _MyPullToRefreshState();
}

class _MyPullToRefreshState extends State<MyPullToRefresh> with AppBase {
  @override
  Widget build(BuildContext context) => buildRefreshListView();

  Widget buildRefreshListView() => DefaultTabController(
        length: 2,
        child: buildTabs(),
      );

  Widget buildTabs() => Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          toolbarHeight: 65.0,
          elevation: 0.0,
          backgroundColor: AppColors.grey,
          automaticallyImplyLeading: false,
          flexibleSpace: PreferredSize(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(
                  left: 25.0, top: 10.0, right: 25.0, bottom: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const TabBar(
                labelColor: Colors.lightBlue,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.only(
                    left: 15.0, top: 0.0, right: 15.0, bottom: 0.0),
                indicatorColor: Colors.lightBlue,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Text(
                      "ListView",
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "GridView",
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(70.0),
          ),
        ),
        body: buildTabBarView(),
      );

  Widget buildTabBarView() => const TabBarView(
        children: [
          MyListRefresh(),
          MyGridRefresh(),
        ],
      );
}
