import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:flutter_svg/svg.dart';

class RateUserDialog extends StatefulWidget {
  const RateUserDialog({super.key});

  @override
  State<RateUserDialog> createState() => _RateUserDialogState();
}

class _RateUserDialogState extends State<RateUserDialog> {
  @override
  Widget build(BuildContext context) {
    return DialogBuilder(builder: (dialogKey) {
      return Container(
        key: dialogKey,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: Palette.aquayarWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "Rate the customer",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Palette.aquayarBlack),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close)),
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacer(
                    flex: .5,
                  ),
                  Text(
                    "We take your reviews and complaints very seriously.",
                    style:
                        TextStyle(fontSize: 14.sp, color: Palette.aquayarGrey),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      height: 50.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child:
                                    SvgPicture.asset("assets/svgs/star.svg"));
                          },
                          itemCount: 5,
                        ),
                      )),
                  CustomTextField(
                    expands: true,
                    height: 100.h,
                    hint: "Type a review",
                  ),
                  const CustomSpacer(
                    flex: 5,
                  ),
                  Button(
                    text: "Submit",
                    textColor: Palette.aquayarBlack,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    outlined: true,
                    size: Size(
                      150.w,
                      40.h,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
