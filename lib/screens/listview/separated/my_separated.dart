import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/listview/separated/separated_model.dart';

class MySeparated extends StatefulWidget {
  const MySeparated({Key? key}) : super(key: key);

  @override
  _MySeparatedState createState() => _MySeparatedState();
}

class _MySeparatedState extends State<MySeparated> with AppBase {
  List<SeparatedModel> mListView = SeparatedList.dummy;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildListView(),
    );
  }

  Widget buildListView() => ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.pink,
          ),
      itemCount: mListView.length,
      itemBuilder: (context, idx) {
        final item = mListView[idx];
        return Card(
          elevation: 8.0,
          child: ListTile(
            title: Text(item.name),
            subtitle: Text(item.subTitle ?? ''),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
            ),
            trailing: Icon(item.img),
            onTap: () => showToast(item.name),
          ),
        );
      });
}
