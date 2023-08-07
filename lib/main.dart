import 'package:aquayar_driver/handlers/navigation_handler.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/locator.dart';
import 'package:aquayar_driver/utils/providers.dart';
import 'package:aquayar_driver/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 630),
        builder: (BuildContext context, Widget? child) {
          return MultiProvider(
              providers: AppProvider.providers,
              builder: (context, child) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  navigatorKey: locator<NavigationHandler>().navigatorKey,
                  theme: ThemeData(
                    fontFamily: 'NeuePlak',
                    primarySwatch: Colors.blue,
                  ),
                  onGenerateRoute: RouteGenerator.onGenerateRoute,
                  initialRoute: splashScreenViewRoute,
                );
              });
        });
  }
}
