import 'package:aquayar_driver/data/local/local_cache.dart';
import 'package:aquayar_driver/handlers/navigation_handler.dart';
import 'package:aquayar_driver/utils/locator.dart';
import 'package:aquayar_driver/utils/logger.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  late NavigationHandler navigationHandler;
  late LocalCache localCache;
  BaseViewModel(
      {
      NavigationHandler? navigationHandler,
      LocalCache? localCache,}) {
    this.navigationHandler = navigationHandler ?? locator();
    this.localCache = localCache ?? locator();
  }
  bool _loading = false;
  bool get loading => _loading;

  bool _signedIn = false;
  bool get signedIn => _signedIn;

  void toggleLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void toggleSignedIn(bool val) {
    _signedIn = val;
    print("Signed in: $_signedIn");
    notifyListeners();
  }

  void log(Object? e) {
    AppLogger.log(e);
  }
}
