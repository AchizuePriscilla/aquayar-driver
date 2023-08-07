import 'package:aquayar_driver/views/onboarding/onboarding_viewmodel.dart';
import 'package:aquayar_driver/views/sign_up/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../views/splash_screen/splash_screen_view_model.dart';
class AppProvider {
  //The providers for dependency injection and state management will be added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => OnboardingVM()),
    ChangeNotifierProvider(create: (_) => SplashScreenVM()),
    ChangeNotifierProvider(create: (_) => SignUpVM())
  ];
}
