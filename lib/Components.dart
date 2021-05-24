class AppData {
  static final AppData _appData = new AppData._internal();

  bool isPro;

  factory AppData() {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();