import 'package:aquayar_driver/navigation/finish_order_dialog_args.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';

class DialogCard extends StatefulWidget {
  final FinishOrderDialogArgs request;

  const DialogCard({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  State<DialogCard> createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogCard> {

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
              width: 190.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: Palette.aquayarBlack,
                  borderRadius: BorderRadius.circular(30.w)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Amount to be paid by customer",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Palette.aquayarWhite, fontSize: 14.sp),
                  ),
                  const CustomSpacer(
                    flex: 2,
                  ),
                  Text(
                    "\$2300",
                    style:
                        TextStyle(color: Palette.aquayarWhite, fontSize: 32.sp),
                  )
                ],
              ),
            ),
            const CustomSpacer(flex: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: Palette.aquayarWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                  ),
                  Text(
                    "Confirm this order",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Text(
                    "Drag the button from left to right to complete this order. Kindly make sure that the correct amount has been paid by the customer through their app.",
                    style:
                        TextStyle(fontSize: 14.sp, color: Palette.aquayarGrey),
                  ),
                  const CustomSpacer(
                    flex: 4,
                  ),
                  Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.lightGrey),
                        color: Palette.offWhite,
                        borderRadius: BorderRadius.circular(30.w)),
                    child: Stack(
                      children: [
                        LongPressDraggable(
                            data: "",
                            axis: Axis.horizontal,
                            childWhenDragging: const SizedBox(),
                            dragAnchorStrategy: childDragAnchorStrategy,
                            onDragStarted: () {},
                            onDragEnd: (details) {},
                            feedback: Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Palette.aquayarWhite,
                                border: Border.all(color: Palette.lightGrey),
                              ),
                              child: const Center(
                                  child: Icon(Icons.arrow_forward_ios)),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 46.h,
                                  width: 46.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Palette.aquayarWhite,
                                    border:
                                        Border.all(color: Palette.lightGrey),
                                  ),
                                  child: Center(
                                      child: Icon(Icons.arrow_forward_ios)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Slide to confirm",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            )),
                        DragTarget(
                          builder: (context, candidateItems, rejectedItems) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 50.h,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Palette.lightGrey)),
                              ),
                            );
                          },
                          onAccept: (item) {
                          
                            Navigator.pushReplacementNamed(
                                context, successfulDeliveryViewRoute);
                          },
                        )
                      ],
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
