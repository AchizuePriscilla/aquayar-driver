import 'package:aquayar_driver/handlers/dialog_handler.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/locator.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WithdrawBalanceView extends StatelessWidget {
  const WithdrawBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          text: "Withdraw Balance",
        ),
        builder: (context, size) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacer(
                  flex: 3,
                ),
                Text(
                  "Withdraw from",
                  style: AquayarTextStyles.body,
                ),
                const CustomSpacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 60.h,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Palette.offWhite,
                      border: Border.all(color: Palette.lightGrey),
                      borderRadius: BorderRadius.circular(23.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Main Wallet Balance",
                        style: AquayarTextStyles.body,
                      ),
                      const CustomSpacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$24,000",
                            style:
                                AquayarTextStyles.h6.copyWith(fontSize: 18.sp),
                          ),
                          Text(
                            ".25",
                            style: AquayarTextStyles.h6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const CustomSpacer(
                  flex: 3,
                ),
                Text(
                  "Withdraw to",
                  style: AquayarTextStyles.body,
                ),
                const CustomSpacer(),
                const AccountContainer(),
                const CustomSpacer(
                  flex: 3,
                ),
                const AccountContainer(),
                const CustomSpacer(
                  flex: 3,
                ),
                Button(
                  text: "Add Withdrawal Account",
                  onPressed: () {
                    locator<DialogHandler>()
                        .showDialog(routeName: addWithdrawalAccountDialogRoute);
                  },
                  outlined: true,
                  textColor: Palette.aquayarBlack,
                )
              ],
            ),
          );
        });
  }
}

class AccountContainer extends StatelessWidget {
  const AccountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Palette.aquayarWhite,
          border: Border.all(color: Palette.lightGrey),
          borderRadius: BorderRadius.circular(23.w)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomRadio(value: 0, groupValue: 0, onChanged: (value) {}),
                  const CustomSpacer(
                    horizontal: true,
                    flex: 2,
                  ),
                  SizedBox(
                      height: 14.h,
                      width: 14.h,
                      child: Image.asset("assets/images/fidelity.png")),
                  const CustomSpacer(
                    horizontal: true,
                    flex: 1.5,
                  ),
                  Text(
                    "Fidelity bank",
                    style: AquayarTextStyles.subtitle1,
                  )
                ],
              ),
              const CustomSpacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account number",
                        style: AquayarTextStyles.subtitle1
                            .copyWith(color: Palette.aquayarGrey),
                      ),
                      const CustomSpacer(
                        flex: .5,
                      ),
                      Text(
                        "1092084948",
                        style: AquayarTextStyles.body
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const CustomSpacer(
                    flex: 3,
                    horizontal: true,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account name",
                        style: AquayarTextStyles.subtitle1
                            .copyWith(color: Palette.aquayarGrey),
                      ),
                      const CustomSpacer(
                        flex: .5,
                      ),
                      Text(
                        "Account name",
                        style: AquayarTextStyles.body
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset("assets/svgs/trash.svg"),
          const Spacer(),
          SvgPicture.asset("assets/svgs/edit.svg")
        ],
      ),
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  const CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Palette.grey2)),
        child: Center(
          child: Icon(
            Icons.circle,
            size: 12.h,
            color: selected ? Palette.aquayarBlack : null,
          ),
        ),
      ),
    );
  }
}
