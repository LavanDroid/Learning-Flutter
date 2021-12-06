import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/listview/search/Widget/search_widget.dart';
import 'package:flutter_demo/screens/listview/search/book.dart';

class FullScreenDialog extends StatefulWidget {
  final String hint;
  final bool isShowSearch;
  final VoidCallback onSelectedItem;
  final List<Book> books;

  const FullScreenDialog({
    Key? key,
    required this.hint,
    required this.isShowSearch,
    required this.onSelectedItem,
    required this.books,
  }) : super(key: key);

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> with AppBase {
  List<Book> booksList = [];
  String query = '';
  Timer? debouncer;

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

  Widget contentBox() => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
              left: 20.0, top: 45.0 + 20.0, right: 20.0, bottom: 20.0),
          margin: const EdgeInsets.only(top: 45.0),
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
        margin: 15.0,
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
      );
}
