// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_demo/constants/app_constants.dart';

import '../book.dart';
import 'package:dio/dio.dart';

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    // try {
    var dio = Dio();
    final response = await dio.get(AppConstants.apiGetBookPath);
    if (response.statusCode == 200) {
      final List books = json.decode(response.data);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }

    /* } on DioError catch (ex) {
      AppPrint.getStaticPrint(ex);
    } catch (e) {
      AppPrint.getStaticPrint(e);
    } */
  }
}
