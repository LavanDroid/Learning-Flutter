import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/model/main_model.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/screens/listview/item_widgets.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> with AppBase {
  late List<MainModelTwo> mListview;

  @override
  void initState() {
    super.initState();
    mListview = CatalogModel.items2;
    mListview.sort((a, b) => a.id.compareTo(b.id));
  }

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'ListView',
          ),
          body: buildListScreen(),
        ),
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
