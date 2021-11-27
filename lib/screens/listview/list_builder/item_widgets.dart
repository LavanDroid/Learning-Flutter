import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/listview/list_builder/builder_model.dart';

class MyItemWidget extends StatelessWidget {
  final BuilderModel item;
  final VoidCallback onTap;

  const MyItemWidget({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: AssetImage(images[index]),
          backgroundImage: NetworkImage(item.img),
        ),
        title: Text(item.name),
        subtitle: const Text('This is subtitle'),
        onTap: onTap,
      ),
    );
  }
}