class AppConstants {
  static const bool inProduction = bool.fromEnvironment('dart.vm.product');

  //? Api path !//
  static const String apiGetBookPath =
      'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json';
}
