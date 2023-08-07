import 'package:aquayar_driver/shared/custom_page_indicator.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/views/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  OnboardingViewState createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  // int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<OnboardingVM>().initState(_pageController);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var onboardingVM = context.read<OnboardingVM>();

    return ResponsiveWidget(builder: (context, size) {
      return Column(
        children: [
          SizedBox(
            height: size.height * .8,
            child: Stack(
              children: [
                PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: onboardingVM.pageController,
                  // reverse: true,
                  onPageChanged: (index) {
                    onboardingVM.changePage(index);
                    setState(() {
                      onboardingVM.currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _pages[index % _pages.length],
                        const CustomSpacer(
                          flex: 3,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: CustomPageIndicator(
                                currentPage: onboardingVM.currentIndex,
                                itemCount: 3,
                                onPageSelected: (page) {},
                                color: Palette.lightGrey)),
                        const CustomSpacer(),
                        _textPart[index % _textPart.length]
                      ],
                    );
                  },
                  itemCount: _pages.length,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Button(
              text: "Sign up as Driver",
              onPressed: () {
                onboardingVM.navigateToSignUp();
              },
              hasIcon: true,
            ),
          ),
          const CustomSpacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Button(
              text: "Login",
              onPressed: () {},
              outlined: true,
              textColor: Palette.aquayarBlack,
            ),
          ),
          const CustomSpacer(
            flex: 5,
          )
        ],
      );
    });
  }
}

class _Pages extends StatelessWidget {
  final Widget widget1;
  final Widget? widget2;
  const _Pages({Key? key, required this.widget1, this.widget2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Palette.aquayarBlack,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80.w),
                  bottomRight: Radius.circular(80.w))),
          child: Stack(
            children: [
              widget1,
              widget2 ?? const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const TransparentAquayarIcon(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TextPart extends StatelessWidget {
  final String header;
  final String subText;
  const _TextPart({
    Key? key,
    required this.header,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: <Widget>[
          Text(header,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w400,
              )),
          const CustomSpacer(),
          Text(
            textAlign: TextAlign.center,
            subText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Palette.aquayarGrey,
            ),
          ),
        ],
      ),
    );
  }
}

final List<Widget> _textPart = <Widget>[
  const _TextPart(
    header: 'Deliver water using the Aquayar App',
    subText: 'Aquayar brings you closer to better water services',
  ),
  const _TextPart(
    header: 'Connect with customers who are closest to you 👋🏿',
    subText: 'Aquayar brings you closer to better water services',
  ),
  const _TextPart(
    header: 'More deliveries, more reach, more money 💸',
    subText: 'Aquayar brings you closer to better water services',
  ),
];
final List<Widget> _pages = <Widget>[
  _Pages(
    widget1: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80.w),
          bottomRight: Radius.circular(80.w)),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            'assets/svgs/slanted_rectangle.svg',
          )),
    ),
    widget2: SvgPicture.asset(
      'assets/svgs/circle.svg',
    ),
  ),
  _Pages(
    widget1: Align(
      alignment: Alignment.bottomLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80.w),
            bottomRight: Radius.circular(80.w)),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/images/onboarding_two.png',
            )),
      ),
    ),
  ),
  _Pages(
    widget1: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80.w),
          bottomRight: Radius.circular(80.w)),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            'assets/svgs/onboarding_three.svg',
          )),
    ),
  ),
];
