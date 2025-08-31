class AppConfig {
  static final AppConfig _instance = AppConfig._privateConstructor();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._privateConstructor();

  final String baseApiUrl = 'http://114.205.42.7/api';
}