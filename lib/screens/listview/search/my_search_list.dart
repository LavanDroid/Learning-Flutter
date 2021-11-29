import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

import 'Api/books_api.dart';
import 'Widget/search_widget.dart';
import 'book.dart';

class MySearchList extends StatefulWidget {
  const MySearchList({Key? key}) : super(key: key);

  @override
  _MySearchListState createState() => _MySearchListState();
}

class _MySearchListState extends State<MySearchList> with AppBase {
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
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  Widget buildAppBar() => Scaffold(
        backgroundColor: appColor.mGrey,
        /* appBar: const CommonAppBar(
          icon: 'assets/images/ic_custom_back.png',
          title: 'Search ListView',
        ), */
        body: buildSearchListScreen(),
      );

  Widget buildSearchListScreen() => GestureDetector(
        // onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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

  Widget buildSearchView() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await BooksApi.getBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

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
