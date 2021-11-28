import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MySimpleList extends StatelessWidget {
  const MySimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late AppBase appBase = AppBase();

    return buildListView(appBase);
  }

  Widget buildListView(AppBase appBase) => ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const ListTile(
            title: Text("Simple Item"),
          ),
          ListTile(
            title: const Text("Battery Full"),
            subtitle: const Text("The battery is full."),
            leading: const Icon(Icons.battery_full),
            trailing: const Icon(Icons.star),
            onTap: () => appBase.showToast('Battery Full'),
          ),
          ListTile(
            title: const Text("Anchor"),
            subtitle: const Text("Lower the anchor."),
            leading: const Icon(Icons.anchor),
            trailing: const Icon(Icons.star),
            onTap: () => appBase.showToast('Anchor'),
          ),
          const ListTile(
            title: Text("Card Item"),
          ),
          Card(
              elevation: 8.0,
              child: ListTile(
                title: const Text("Alarm"),
                subtitle: const Text("This is the time."),
                leading: const Icon(Icons.access_alarm),
                trailing: const Icon(Icons.star),
                onTap: () => appBase.showToast('Alarm'),
              )),
          Card(
              elevation: 8.0,
              child: ListTile(
                title: const Text("Ballot"),
                subtitle: const Text("Cast your vote."),
                leading: const Icon(Icons.ballot),
                trailing: const Icon(Icons.star),
                onTap: () => appBase.showToast('Ballot'),
              )),
        ],
      );
}
