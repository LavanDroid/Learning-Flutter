import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyPopupMenu extends StatefulWidget {
  const MyPopupMenu({Key? key}) : super(key: key);

  @override
  _MyPopupMenuState createState() => _MyPopupMenuState();
}

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}

class _MyPopupMenuState extends State<MyPopupMenu> with AppBase {
  late String defaultValue = '';
  final List<PopupItem> mListPopup = [
    PopupItem(1, "First Item"),
    PopupItem(2, "Second Item"),
    PopupItem(3, "Third Item"),
    PopupItem(4, "Fourth Item")
  ];
  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          appBar: const CommonAppBar(
            icon: AppImages.icCustomBack,
            title: 'Popup Menu',
          ),
          body: buildPopMenuScreen(),
        ),
      );

  Widget buildPopMenuScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25.0),
                  buildDefault(),
                  const SizedBox(height: 25.0),
                  buildName(),
                  const SizedBox(height: 25.0),
                  buildHorizIcon(),
                  const SizedBox(height: 25.0),
                  buildVertIcon(),
                  const SizedBox(height: 25.0),
                  buildColorBorder(),
                  const SizedBox(height: 25.0),
                  buildCircle(),
                  const SizedBox(height: 25.0),
                  buildList(),
                  const SizedBox(height: 25.0),
                  buildTextIcon(),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildDefault() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Default',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
            onSelected: (value) => setState(() {
              defaultValue = value.toString();
              showToast(defaultValue);
            }),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("First"),
                value: 'First',
              ),
              const PopupMenuItem(
                child: Text("Second"),
                value: 'Second',
              )
            ],
          )
        ],
      );

  Widget buildName() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Name',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text('Menu'),
              ),
              onSelected: (value) => setState(() {
                    defaultValue = value.toString();
                    showToast(defaultValue);
                  }),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("First Name"),
                      value: 'First Name',
                    ),
                    const PopupMenuItem(
                      child: Text("Second Name"),
                      value: 'Second Name',
                    )
                  ])
        ],
      );

  Widget buildHorizIcon() => CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Horizontal icon',
          hideBack: true,
          menuItem: [
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              itemBuilder: (context) => [],
            )
          ]);

  Widget buildVertIcon() => CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Vertical icon',
          hideBack: true,
          menuItem: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [],
            )
          ]);

  Widget buildColorBorder() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Color & Border',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
            color: Colors.yellowAccent,
            elevation: 20,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text(
                  'First',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.red,
                  ),
                ),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text('Second'),
                value: 2,
              ),
            ],
          )
        ],
      );

  //! Big name can't use this style
  Widget buildCircle() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Circle',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
            color: Colors.yellowAccent,
            shape: const CircleBorder(),
            onCanceled: () {
              //? do something
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('First'), //  jeya veera pandian
                value: 1,
              ),
              const PopupMenuItem(
                child: Text('Second'),
                value: 2,
              ),
            ],
          )
        ],
      );

  Widget buildList() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'List item',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
            color: Colors.yellowAccent,
            elevation: 20,
            enabled: true,
            onSelected: (value) {
              setState(
                () {
                  defaultValue = value.toString();
                },
              );
            },
            itemBuilder: (context) {
              return mListPopup.map((PopupItem choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.name),
                );
              }).toList();
            },
          )
        ],
      );

  Widget buildTextIcon() => CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Text icon',
        hideBack: true,
        menuItem: [
          PopupMenuButton(
            color: Colors.yellowAccent,
            elevation: 20,
            enabled: true,
            onSelected: (value) {
              setState(
                () {
                  defaultValue = value.toString();
                },
              );
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Setting",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                value: 'Setting',
              ),
              //const PopupMenuDivider(),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.article,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Privacy Policy page",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                value: 'Privacy Policy page',
              )
            ],
          )
        ],
      );
}
