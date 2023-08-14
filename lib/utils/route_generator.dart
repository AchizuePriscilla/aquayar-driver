import 'package:aquayar_driver/navigation/media_upload_arg.dart';
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
      case loginViewRoute:
        return _getPageRoute(const LoginView());
      case phoneVerificationViewRoute:
        return _getPageRoute(const PhoneVerificationView());
      case codeVerificationViewRoute:
        return _getPageRoute(const CodeVerificationView());
      case verificationUnderReviewRoute:
        return _getPageRoute(const VerificationUnderReview());
      case homeViewRoute:
        return _getPageRoute(const HomeView());
      case editProfileViewRoute:
        return _getPageRoute(const EditProfileView());
      case changePasswordViewRoute:
        return _getPageRoute(const ChangePasswordView());
      case orderViewRoute:
        return _getPageRoute(const OrderView());
      case rejectReasonViewRoute:
        return _getPageRoute(const RejectReasonView());
      case undergoingDeliveryViewRoute:
        return _getPageRoute(const UndergoingDeliveryView());
      case successfulDeliveryViewRoute:
        return _getPageRoute(const SuccessfulOrderView());
      case mediaUploadViewRoute:
        final mediaUploadArgs = settings.arguments;

        if (mediaUploadArgs != null && mediaUploadArgs is MediaUploadArgs) {
          return _getPageRoute(MediaUploadView(
            args: mediaUploadArgs,
          ));
        }
        return _getPageRoute(
          _errorPage(message: "Media Upload parameters not passed"),
        );

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
