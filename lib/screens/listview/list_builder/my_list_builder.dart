import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/listview/list_builder/builder_model.dart';
import 'package:flutter_demo/screens/listview/list_builder/item_widgets.dart';

class MyListBuilder extends StatefulWidget {
  const MyListBuilder({Key? key}) : super(key: key);

  @override
  _MyListBuilderState createState() => _MyListBuilderState();
}

class _MyListBuilderState extends State<MyListBuilder> with AppBase {
  late List<BuilderModel> mListview;

  @override
  void initState() {
    super.initState();
    mListview = BuilderList.items;
    mListview.sort((a, b) => a.id.compareTo(b.id));
  }

  @override
  Widget build(BuildContext context) => Container(
        child: buildBuilderScreen(),
      );

  Widget buildBuilderScreen() => Scaffold(
        backgroundColor: appColor.mGrey,
        body: buildListScreen(),
      );

  Widget buildListScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: ListView.builder(
              itemCount: mListview.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, idx) {
                final item = mListview[idx];
                return MyItemWidget(
                  item: item,
                  onTap: () => {
                    showToast('Name: ' +
                        item.name +
                        ' => ' +
                        'ID: ' +
                        item.id.toString())
                  },
                );
                /* return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      // backgroundImage: AssetImage(images[index]),
                      backgroundImage: NetworkImage(item.img),
                    ),
                    title: Text(item.name),
                    subtitle: const Text('This is subtitle'),
                    onTap: () {
                      showToast('Name: ' +
                          item.name +
                          ' => ' +
                          'ID: ' +
                          item.id.toString());
                    },
                  ),
                ); */
              }),
        ),
      );
}
