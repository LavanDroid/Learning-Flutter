import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:grouped_list/grouped_list.dart';

class MyGroupList extends StatefulWidget {
  const MyGroupList({Key? key}) : super(key: key);

  @override
  _MyGroupListState createState() => _MyGroupListState();
}

class _MyGroupListState extends State<MyGroupList> with AppBase {
  List elements = [
    {'topicName': 'ListView.builder', 'group': 'ListView Type'},
    {'topicName': 'GridView.count', 'group': 'GridView Type'},
    {'topicName': 'StatefulWidget', 'group': 'Widget'},
    {'topicName': 'GridView.builder', 'group': 'GridView Type'},
    {'topicName': 'ListView.separated', 'group': 'ListView Type'},
    {'topicName': 'GridView.custom', 'group': 'GridView Type'},
    {'topicName': 'ListView', 'group': 'ListView Type'},
    {'topicName': 'GridView.extent', 'group': 'GridView Type'},
    {'topicName': 'ListView.custom', 'group': 'ListView Type'},
    {'topicName': 'StatelessWidget', 'group': 'Widget'},
    {'topicName': 'Elevate Button', 'group': 'Button'},
    {'topicName': 'Outlined Button', 'group': 'Button'},
    {'topicName': 'Text Button', 'group': 'Button'},
    {'topicName': 'Icon Button', 'group': 'Button'},
    {'topicName': 'FAB', 'group': 'Button'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildScreen(),
    );
  }

  Widget buildScreen() => GroupedListView<dynamic, String>(
        elements: elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item2['topicName'].compareTo(item1['topicName']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => groupHeading(value),
        itemBuilder: (c, element) => groupChild(element),
      );

  Widget groupHeading(String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

  Widget groupChild(element) => Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: const Icon(Icons.account_circle),
          title: Text(element['topicName']),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => showToast(element['topicName']),
        ),
      );
}
