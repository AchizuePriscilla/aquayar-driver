import 'dart:async';

import 'package:aquayar_driver/handlers/dialog_handler.dart';
import 'package:aquayar_driver/navigation/finish_order_dialog_args.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UndergoingDeliveryView extends StatefulWidget {
  const UndergoingDeliveryView({super.key});

  @override
  State<UndergoingDeliveryView> createState() => _UndergoingDeliveryViewState();
}

class _UndergoingDeliveryViewState extends State<UndergoingDeliveryView> {
  bool showSnackbar = true;
  bool showFullDetails = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        showSnackbar = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSpacer(
              flex: 8,
            ),
            const CustomSpacer(
              flex: 1,
            ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: size.width,
                  height: size.height * .79,
                  margin: EdgeInsets.symmetric(vertical: 32.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.lightGrey),
                      borderRadius: BorderRadius.circular(20.w),
                      color: Palette.offWhite),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 18.h,
                        ),
                        const CustomSpacer(
                          flex: 1,
                          horizontal: true,
                        ),
                        Text(
                          "Undergoing delivery...",
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ],
                    )),
                Visibility(
                  visible: showSnackbar,
                  child: Positioned(
                      bottom: size.height * .07,
                      child: Container(
                        width: size.width * .87,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.lightGrey),
                            borderRadius: BorderRadius.circular(25.w),
                            color: Palette.aquayarWhite),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Palette.darkGreen,
                              size: 20.h,
                            ),
                            const CustomSpacer(
                              flex: 2,
                              horizontal: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Congrats!",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "You have accepted this order",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Palette.aquayarGrey,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
                Visibility(
                  visible: !showSnackbar,
                  child: Positioned(
                    bottom: size.height * .07,
                    child: Container(
                      width: size.width * .87,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.lightGrey),
                          borderRadius: BorderRadius.circular(25.w),
                          color: Palette.aquayarWhite),
                      child: !showFullDetails
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svgs/person.svg",
                                      color: Palette.aquayarBlack,
                                    ),
                                    const CustomSpacer(
                                      flex: 3,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "Frankpeter Ani",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 33.h,
                                      height: 33.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Palette.lightGrey),
                                          shape: BoxShape.circle,
                                          color: Palette.aquayarWhite),
                                      child: SvgPicture.asset(
                                        "assets/svgs/chat.svg",
                                        height: 24.h,
                                        width: 24.h,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Container(
                                      width: 33.h,
                                      height: 33.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Palette.lightGrey),
                                          shape: BoxShape.circle,
                                          color: Palette.aquayarWhite),
                                      child: SvgPicture.asset(
                                        "assets/svgs/phone.svg",
                                        height: 24.h,
                                        width: 24.h,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ],
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                const Divider(
                                  color: Palette.lightGrey,
                                  thickness: .5,
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svgs/location.svg",
                                      height: 16.h,
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "WTC Estate, Uwani, Enugu",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svgs/water_drop.svg",
                                      height: 16.h,
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "500",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          height: 0.8,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      " Litres",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      "assets/svgs/money.svg",
                                      height: 16.h,
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "\$500",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          height: 0.8,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      ".32",
                                      style: TextStyle(
                                          color: Palette.aquayarGrey,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                const CustomSpacer(
                                  flex: 4,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          showFullDetails = true;
                                        });
                                      },
                                      child: Container(
                                          height: 35.h,
                                          width: 35.h,
                                          padding: EdgeInsets.all(3.h),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Palette.lightGrey,
                                                  width: 1.5)),
                                          child: Icon(
                                            Icons.keyboard_arrow_up,
                                            size: 20.h,
                                          )),
                                    ),
                                    const Spacer(),
                                    Button(
                                      text: "Completed",
                                      onPressed: () {
                                        locator<DialogHandler>().showDialog(
                                            arguments:
                                                const FinishOrderDialogArgs());
                                      },
                                      color: Palette.darkGreen,
                                      size: Size(size.width * .6, 36.h),
                                    )
                                  ],
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svgs/person.svg",
                                      color: Palette.aquayarBlack,
                                    ),
                                    const CustomSpacer(
                                      flex: 3,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "Frankpeter Ani",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 22.h,
                                      width: 73.w,
                                      decoration: BoxDecoration(
                                          color: Palette.offWhite,
                                          border: Border.all(
                                              color: Palette.lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(30.w)),
                                      child: Center(
                                          child: Text(
                                        "AQUAYAR",
                                        style: TextStyle(
                                            color: Palette.aquayarGrey,
                                            fontSize: 12.sp),
                                      )),
                                    )
                                  ],
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const CustomSpacer(
                                          flex: 4,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 20.h,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffF0F0F0)),
                                          child: Center(
                                            child: Container(
                                              height: 10.h,
                                              width: 10.h,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Palette.grey2),
                                            ),
                                          ),
                                        ),
                                        const CustomSpacer(
                                          flex: 1,
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 2,
                                          color: Palette.lightGrey,
                                        ),
                                        const CustomSpacer(
                                          flex: 1,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Palette.green
                                                  .withOpacity(.12)),
                                          child: Center(
                                            child: Container(
                                              height: 10.h,
                                              width: 10.h,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Palette.green),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    SizedBox(
                                      height: 110.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Picked up at",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Palette.aquayarGrey),
                                          ),
                                          Text(
                                            "WTC Estate, Uwani, Enugu",
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                          Text(
                                            "here",
                                            textHeightBehavior:
                                                const TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false,
                                                    applyHeightToLastDescent:
                                                        false),
                                            style: TextStyle(
                                                height: 0.01,
                                                color: Palette.aquayarGrey,
                                                fontSize: 14.sp),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Location to deliver",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Palette.aquayarGrey),
                                          ),
                                          Text(
                                            "WTC Estate, Uwani, Enugu",
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                          Text(
                                            "30km away",
                                            textHeightBehavior:
                                                const TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false,
                                                    applyHeightToLastDescent:
                                                        false),
                                            style: TextStyle(
                                                height: 0.01,
                                                color: Palette.aquayarGrey,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                const CustomSpacer(
                                  flex: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const CustomIcon(
                                      path: "water_drop",
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "500",
                                      style: TextStyle(
                                          fontSize: 23.sp, height: 0.8),
                                    ),
                                    Text(
                                      " Litres",
                                      style: TextStyle(
                                          color: Palette.aquayarGrey,
                                          fontSize: 14.sp),
                                    ),
                                    const Spacer(),
                                    const CustomIcon(
                                      path: "money",
                                    ),
                                    const CustomSpacer(
                                      flex: 2,
                                      horizontal: true,
                                    ),
                                    Text(
                                      "\$500",
                                      style: TextStyle(
                                          fontSize: 23.sp, height: 0.8),
                                    ),
                                    Text(
                                      " .32",
                                      style: TextStyle(
                                          color: Palette.aquayarGrey,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width * .35,
                                      height: 30.h,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Palette.lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(30.w),
                                          color: Palette.aquayarWhite),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svgs/phone.svg"),
                                          const CustomSpacer(
                                            flex: 1,
                                            horizontal: true,
                                          ),
                                          Text(
                                            "Call",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: size.width * .35,
                                      height: 30.h,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Palette.lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(30.w),
                                          color: Palette.aquayarWhite),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svgs/chat.svg"),
                                          const CustomSpacer(
                                            flex: 1,
                                            horizontal: true,
                                          ),
                                          Text(
                                            "Message",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Palette.lightGrey,
                                  thickness: 1.5,
                                ),
                                const CustomSpacer(
                                  flex: 2,
                                ),
                                Container(
                                  height: 32.h,
                                  width: size.width * .87,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.w),
                                      color: Palette.aquayarWhite,
                                      border:
                                          Border.all(color: Palette.lightGrey)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Time left",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Palette.aquayarGrey,
                                        ),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset("assets/svgs/timer.svg"),
                                      Text(
                                        " 30",
                                        style: TextStyle(
                                            color: Palette.aquayarBlack,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        "mins",
                                        style: TextStyle(
                                            color: Palette.aquayarGrey,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                const CustomSpacer(
                                  flex: 2,
                                ),
                                Text(
                                  "Kindly ensure to complete this order before the time limit expires, so as not to be sanctioned.",
                                  style: TextStyle(
                                      color: Palette.aquayarGrey,
                                      fontSize: 13.sp),
                                ),
                                const CustomSpacer(
                                  flex: 4,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          showFullDetails = false;
                                        });
                                      },
                                      child: Container(
                                          height: 35.h,
                                          width: 35.h,
                                          padding: EdgeInsets.all(3.h),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Palette.lightGrey,
                                                  width: 1.5)),
                                          child: const Icon(Icons.close)),
                                    ),
                                    const Spacer(),
                                    Button(
                                      text: "Completed",
                                      onPressed: () {
                                        locator<DialogHandler>().showDialog(
                                            arguments:
                                                const FinishOrderDialogArgs());
                                      },
                                      color: Palette.darkGreen,
                                      size: Size(size.width * .6, 36.h),
                                    )
                                  ],
                                )
                              ],
                            ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * .775,
                  child: Container(
                    height: 32.h,
                    width: size.width * .87,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        color: Palette.aquayarWhite,
                        border: Border.all(color: Palette.lightGrey)),
                    child: Row(
                      children: [
                        Text(
                          "Location:",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.aquayarGrey,
                          ),
                        ),
                        Text(
                          "  WTC Estate ",
                          style: TextStyle(
                              color: Palette.aquayarBlack, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
