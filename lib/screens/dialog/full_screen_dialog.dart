import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/listview/search/Widget/search_widget.dart';
import 'package:flutter_demo/screens/listview/search/book.dart';

typedef OnSelectedItem = void Function(Book item);

class FullScreenDialog extends StatefulWidget {
  final String hint;
  final bool isShowSearch;
  //final VoidCallback onPressed;
  final List<Book> books;
  final OnSelectedItem callback;

  const FullScreenDialog({
    Key? key,
    required this.hint,
    required this.isShowSearch,
    //required this.onPressed,
    required this.books,
    required this.callback,
  }) : super(key: key);

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> with AppBase {
  List<Book> booksList = [];
  String query = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final mBooks = widget.books;

    setState(() => booksList = mBooks);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 800),
  }) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(),
    );
  }

  Widget contentBox() => SafeArea(
        child: Container(
          // width: getScreenWidth(context),
          // height: getScreenHeight(context),
          padding: const EdgeInsets.all(5.0),
          //margin: const EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              buildSearchView(),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: booksList.length,
                    itemBuilder: (context, idx) {
                      final book = booksList[idx];
                      return buildBook(book);
                    }),
              )
            ],
          ),
        ),
      );

  buildSearchView() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
        margin: 10.0,
      );

  void searchBook(String search) {
    final books = widget.books.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = search.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      query = search;
      booksList = books;
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
      onTap: () {
        appPrint(book.title);
        widget.callback(book);
        // widget.onPressed;
        Navigator.of(context).pop();
      });
}
