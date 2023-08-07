import 'package:aquayar_driver/core/base_viewmodel.dart';
import 'package:aquayar_driver/utils/constants.dart';

class SignUpVM extends BaseViewModel {
  void signUp() {
    navigationHandler.pushNamed(phoneVerificationViewRoute);
  }
}
