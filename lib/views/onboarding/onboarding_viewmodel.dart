// ignore_for_file: unnecessary_getters_setters

import 'package:aquayar_driver/core/base_viewmodel.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:flutter/material.dart';

class OnboardingVM extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) => _currentIndex = index;

  late PageController _pageController;
  PageController get pageController => _pageController;

  ///Handles navigation when `Next` or `Skip` buttons are tapped
  Future<void> changePage(int index, [bool tapped = false]) async {
    _currentIndex = index;
    //if current page is last page, exit onboarding view
    if (_currentIndex == 3 && tapped) {
      await navigateToSignUp();
      return;
    }
    //else, animate to next onboarding page
    // _currentIndex != 2 ? _currentIndex++ : _currentIndex = 0;

    pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  ///Initializes [_pageController] and starts animation
  void initState(PageController controller) {
    _pageController = controller;
  }

  ///Navigate to SignUpPagesView and cache onboarding status
  Future<void> navigateToSignUp() async {
    await localCache.saveToLocalCache(key: onboardingDone, value: true);
    navigationHandler.pushReplacementNamed(signUpViewRoute);
  }
}
