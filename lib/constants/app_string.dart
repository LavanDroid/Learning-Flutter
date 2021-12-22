class AppStrings {
  //* Singleton logic
  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();
  factory AppStrings() {
    return _instance;
  }

  static const String welcomeMessage = "Welcome To Flutter";
}
