import 'package:flutter/material.dart';
// import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/model/main_model.dart';

class MyItemWidget extends StatelessWidget {
  final MainModelTwo item;
  final VoidCallback onTap;

  const MyItemWidget({Key? key, required this.item, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AppBase appBase = AppBase();
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: AssetImage(images[index]),
          backgroundImage: NetworkImage(item.img),
        ),
        title: Text(item.name),
        subtitle: const Text('This is subtitle'),
        onTap: onTap, /*() {
          appBase.showToast(
              'Name: ' + item.name + ' => ' + 'ID: ' + item.id.toString());
        }, */
      ),
    );
  }
}
