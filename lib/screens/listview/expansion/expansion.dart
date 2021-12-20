import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyExpansion extends StatefulWidget {
  const MyExpansion({Key? key}) : super(key: key);

  @override
  _MyExpansionState createState() => _MyExpansionState();
}

class _MyExpansionState extends State<MyExpansion> with AppBase {
  final List<Item> _books = generateItems(20);
  @override
  Widget build(BuildContext context) => buildScreen();

  Widget buildScreen() => SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _books[index].isExpanded = !isExpanded;
            });
          },
          children: _books.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      );
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
