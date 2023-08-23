import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';

class AddWithdrawalAccountDialog extends StatelessWidget {
  const AddWithdrawalAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogBuilder(builder: (dialogKey) {
      return Container(
        key: dialogKey,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: Palette.aquayarWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 20.h,
                        )),
                  ),
                  Text(
                    "Add Withdrawal Account",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You’ll be credited every last Friday of the month.",
                    style: AquayarTextStyles.greyBody.copyWith(fontSize: 13.sp),
                  ),
                  const CustomSpacer(
                    flex: 2,
                  ),
                  Form(
                      child: Column(
                    children: [
                      const CustomSpacer(
                        flex: 3,
                      ),
                      const CustomTextField(
                        label: "Account Number",
                        isBold: true,
                      ),
                      const CustomSpacer(
                        flex: 2,
                      ),
                      CustomDropDown(
                        items: [],
                        onchanged: (newValue) {},
                        label: "Select Bank",
                        isBold: true,
                      ),
                      const CustomSpacer(
                        flex: 3,
                      ),
                      const CustomTextField(
                        label: "Account Name",
                        isBold: true,
                      ),
                      const CustomSpacer(
                        flex: 4,
                      ),
                      Button(
                        text: "Add Withdrawal Account",
                        onPressed: () async {},
                      ),
                      const CustomSpacer(
                        flex: 4,
                      ),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
