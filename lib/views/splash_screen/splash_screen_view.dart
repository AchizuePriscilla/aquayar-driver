import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/views/splash_screen/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    final splashScreenVM = context.read<SplashScreenVM>();
    splashScreenVM.handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      backgroundColor: Palette.aquayarBlack,
      builder: (context, size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              children: [
                const TransparentAquayarIcon(),
                Center(child: SvgPicture.asset("assets/svgs/aquayar_logo.svg"))
              ],
            ),
          ),
        );
      },
    );
  }
}
