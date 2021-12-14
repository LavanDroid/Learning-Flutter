import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final IconData icon;
  final double size;

  const TabBarButton({Key? key, required this.icon, this.size = 60.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}

class DummyHomePage2 extends StatelessWidget {
  const DummyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Buttons'),
      ),
      body: Column(
        children: [
          CustomTabBar(),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  var _selection = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.topCenter,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 18.0),
            child: ToggleButtons(
              isSelected: _selection,
              onPressed: (index) {
                setState(() {
                  _selection = List.generate(
                    _selection.length,
                    (i) => index == i ? true : false,
                  );
                });
              },
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
              borderWidth: 4.0,
              borderColor: Colors.blue[400],
              selectedBorderColor: Colors.blue,
              highlightColor: Colors.blue.withOpacity(0.2),
              children: const [
                TabBarButton(icon: Icons.settings),
                TabBarButton(icon: Icons.add),
                TabBarButton(icon: Icons.settings_remote)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
