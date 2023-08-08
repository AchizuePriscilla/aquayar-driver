import 'package:aquayar_driver/core/base_viewmodel.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpVM extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) => _currentIndex = index;

  late PageController _pageController;
  PageController get pageController => _pageController;

  ///Initializes [_pageController] and starts animation
  void initState(PageController controller) {
    _pageController = controller;
  }

  void signUp() {
    navigationHandler.pushNamed(phoneVerificationViewRoute);
  }

  //Handles navigation when `Next` or `Skip` buttons are tapped
  Future<void> changePage(int index, [bool tapped = false]) async {
    _currentIndex = index;
    pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
