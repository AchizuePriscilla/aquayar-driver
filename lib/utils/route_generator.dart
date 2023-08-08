import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/views.dart';
import 'constants.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenViewRoute:
        return _getPageRoute(const SplashScreenView());
      case onboardingScreenViewRoute:
        return _getPageRoute(const OnboardingView());
      case signUpViewRoute:
        return _getPageRoute(const SignUpView());
      case phoneVerificationViewRoute:
        return _getPageRoute(const PhoneVerificationView());
      case codeVerificationViewRoute:
        return _getPageRoute(const CodeVerificationView());
      case mediaUploadViewRoute:
        return _getPageRoute(const MediaUploadView());

      default:
        return _getPageRoute(_errorPage());
    }
  }

  //Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    String? routeName,
    dynamic args,
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        settings: RouteSettings(
          name: routeName,
          arguments: args,
        ),
      );

  ///Error page shown when app attempts navigating to an unknown route
  static Widget _errorPage({String message = "Error! Page not found"}) =>
      Scaffold(
        appBar: AppBar(
            title: const Text(
          'Page not found',
          style: TextStyle(color: Colors.red),
        )),
        body: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
}
