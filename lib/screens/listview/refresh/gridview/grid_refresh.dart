import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import '../refresh_widget.dart';

class MyGridRefresh extends StatefulWidget {
  const MyGridRefresh({Key? key}) : super(key: key);

  @override
  _MyGridRefreshState createState() => _MyGridRefreshState();
}

class _MyGridRefreshState extends State<MyGridRefresh> with AppBase {
  // final keyRefresh = GlobalKey<RefreshIndicatorState>();
  List<int> data = [];

  @override
  void initState() {
    super.initState();

    loadList();
  }

  Future loadList() async {
    // keyRefresh.currentState?.show();
    await Future.delayed(const Duration(milliseconds: 1000));

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
      : RefreshWidget(
          onRefresh: loadList,
          // keyRefresh: keyRefresh,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            primary: false,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final number = data[index];

              return buildItem(number);
            },
          ),
        );

  Widget buildItem(int number) => GridTile(
        child: Center(
          child: Text('$number', style: const TextStyle(fontSize: 32)),
        ),
      );
}
