import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';


class MyListRefresh extends StatefulWidget {
  const MyListRefresh({Key? key}) : super(key: key);

  @override
  _MyListRefreshState createState() => _MyListRefreshState();
}

class _MyListRefreshState extends State<MyListRefresh> with AppBase {
  //final keyRefresh = GlobalKey<RefreshIndicatorState>();
  List<int> data = [];

  @override
  void initState() {
    super.initState();

    loadList();
  }

  Future loadList() async {
    //keyRefresh.currentState?.show();
    await Future.delayed(const Duration(milliseconds: 400));

    final random = Random();
    final data = List.generate(100, (_) => random.nextInt(100));

    setState(() => this.data = data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(),
    );
  }

  Widget buildList() => data.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : RefreshIndicator(
          // RefreshIndicator or RefreshWidget
          //keyRefresh: keyRefresh,
          onRefresh: loadList,
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final number = data[index];

              return buildItem(number);
            },
          ),
        );

  Widget buildItem(int number) => ListTile(
        title: Center(
          child: Text('$number', style: const TextStyle(fontSize: 32)),
        ),
      );
}
