import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/screens/dialog/book_data.dart';
import 'package:flutter_demo/screens/listview/search/Widget/search_widget.dart';
import 'package:flutter_demo/screens/listview/search/book.dart';

import 'custom_dialog_box.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> with AppBase {
  List<Book> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 800),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final mBooks = allBooks;

    setState(() => books = mBooks);
  }

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: const CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'Dialog',
          ),
          body: buildDialogScreen(),
        ),
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
          myFullDialog();
        },
        child: const Text('Full Screen Dialog'),
      );

  void myFullDialog() {
    showGeneralDialog(
        //barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Center(
                child: Column(
                  children: [
                    buildSearchView(),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: books.length,
                          itemBuilder: (context, idx) {
                            final book = books[idx];
                            return buildBook(book);
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierColor: Colors.black45,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => Container());
  }

  Widget buildSearchView() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  Widget buildBook(Book book) => ListTile(
        leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.title),
        subtitle: Text(book.author),
      );
}
