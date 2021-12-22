import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';
import 'package:flutter_demo/screens/dialog/book_data.dart';
import 'package:flutter_demo/screens/listview/search/book.dart';

import 'custom_dialog_box.dart';
import 'full_screen_dialog.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> with AppBase {
  List<Book> books = [];
  late Book onSelectedItem;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final mBooks = allBooks;

    setState(() => books = mBooks);
  }

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Dialog',
        ),
        body: buildDialogScreen(),
      );

  Widget buildDialogScreen() => GestureDetector(
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
                  buildSimpleDialog(),
                  const SizedBox(height: 25.0),
                  buildCallDialog(),
                  const SizedBox(height: 25.0),
                  buildFullScreenDialog(),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildSimpleDialog() => ElevatedButton(
        onPressed: () {
          callSimpleDialog();
        },
        child: const Text('Simple Dialog'),
      );

  void callSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Alert!'),
        contentPadding: const EdgeInsets.all(20.0),
        children: [
          const Text('Simple Flutter Dialog'),
          const SizedBox(height: 15.0),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget buildCallDialog() => ElevatedButton(
        onPressed: () {
          myGeneralDialog();
          /* showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  title: 'Custom Dialog Demo',
                  descriptions:
                      'Hi all this is a custom dialog in flutter and  you will be use in your flutter applications',
                  textYes: 'Yes',
                  textNo: 'Cancel',
                  isShowNo: false,
                  onYesPressed: () => {
                    Navigator.of(context).pop(),
                  },
                  onNoPressed: () => {
                    Navigator.of(context).pop(),
                  },
                );
              }); */
        },
        child: const Text('Custom Dialog'),
      );

  void myGeneralDialog() {
    showGeneralDialog(
        //barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: CustomDialogBox(
                title: 'Custom Dialog Demo',
                descriptions:
                    'Hi all this is a custom dialog in flutter and  you will be use in your flutter applications',
                textYes: 'Yes',
                textNo: 'Cancel',
                isShowNo: false,
                onYesPressed: () => {
                  Navigator.of(context).pop(),
                },
                onNoPressed: () => {
                  // Navigator.of(context).pop(),
                },
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => Container());
  }

  Widget buildFullScreenDialog() => ElevatedButton(
        onPressed: () {
          customFullScreenDialog();
        },
        child: const Text('Full Screen Dialog'),
      );

  customFullScreenDialog() {
    showGeneralDialog(
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: widget),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierColor: Colors.black45,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => FullScreenDialog(
              hint: 'Title or Author Name',
              isShowSearch: true,
              books: books,
              callback: (itemSeleted) => setState(() {
                onSelectedItem = itemSeleted;
                showToast(onSelectedItem.title);
              }),
            ));
  }
}
