class AppConstants {
  static const bool inProduction = bool.fromEnvironment('dart.vm.product');

  //! Class Route !//
  static const String home = '/'; //? Default set like this
  static const String appBar = '/appbar';
  static const String button = '/button';
  static const String radioButton = '/radio_button';
  static const String switchButton = '/switch_button';
  static const String toggleButton = '/toggle_button';
  static const String checkBox = '/check_box';
  static const String dialog = '/dialog';
  static const String dropdown = '/dropdowm';
  static const String listview = '/listview';
  static const String popupMenu = '/popup_menu';
  static const String textField = '/text_field';
  static const String textview = '/textview';
  static const String expansionTile = '/expansion_tile';
  // static const String toast = '/toast';

  //! Api path !//
  static const String apiGetBookPath =
      'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json';
}
