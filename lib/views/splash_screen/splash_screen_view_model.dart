import 'package:aquayar_driver/core/base_viewmodel.dart';
import 'package:aquayar_driver/utils/constants.dart';

class SplashScreenVM extends BaseViewModel {
  ///Checks if there is any cached page and navigates to it
  bool _checkLastPage() {
    bool isCached = false;
    // String lastPageAccessed = localCache.getFromLocalCache(lastPage) as String;

    // if (lastPageAccessed == AccountVerificationViewRoute) {
    //   isCached = true;
    //   navigationHandler.pushReplacementNamed(
    //     AccountVerificationViewRoute,
    //     arg: AccountVerificationArgs(cached: true),
    //   );
    // }
    return isCached;
  }

  ///Handles navigation from SplashScreenView on app start
  Future<void> handleNavigation() async {
    await Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    ).then((value) async {
      await localCache.getToken().then(
        (token) async {
          //check if user is logged in
          if (token != null && token.isNotEmpty) {
            //if user is logged in
          } else {
            //#beginning of user not logged in flow
            //if user is not logged in, check if user has been onboarded
            bool hasBeenOnboarded =
                localCache.getFromLocalCache(onboardingDone) != null;

            if (hasBeenOnboarded) {
              //if user has been onboarded, check if there is any cached page
              //and navigate to it, if any
              // if (_checkLastPage()) {
              //   return;
              // }

              //no cached page but user has been onboarded?
              //navigate to LoginView

              navigationHandler.pushReplacementNamed(signUpViewRoute);
            } else {
              //   //if user has not been onboarded, navigate to OnboardingView
              navigationHandler.pushReplacementNamed(onboardingScreenViewRoute);
            }
            //#end of user not logged in flow
          }
        },
      );
    });
  }
}
