import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';

class RejectReasonView extends StatefulWidget {
  const RejectReasonView({super.key});

  @override
  State<RejectReasonView> createState() => _RejectReasonViewState();
}

class _RejectReasonViewState extends State<RejectReasonView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          implyLeading: false,
          actionWidgets: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: const Icon(
                    Icons.close,
                    color: Palette.aquayarBlack,
                  ),
                ))
          ],
        ),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacer(
                  flex: 2,
                ),
                Text(
                  "Reason for \nrejecting order",
                  style: AquayarTextStyles.h1,
                ),
                Text(
                  "Please keep in mind that this action cannot be undone, and we won't be able to retrieve any of your data once it's deleted.",
                  style: AquayarTextStyles.greyBody,
                ),
                const CustomSpacer(
                  flex: 4,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        List<String> reasons = [
                          "Price is too small",
                          "Location is out of range",
                          "Dropoff is out of range",
                          "Not enough fuel to complete order",
                          "Other"
                        ];
                        return RejectReasonWidget(
                          label: reasons[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Palette.lightGrey,
                        );
                      },
                      itemCount: 5),
                ),
                const CustomSpacer(
                  flex: 5,
                ),
                Button(text: "Send", onPressed: () {}),
                const CustomSpacer(
                  flex: 5,
                ),
              ],
            ),
          );
        });
  }
}

class RejectReasonWidget extends StatelessWidget {
  final String label;
  const RejectReasonWidget({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SizedBox(
            height: 11.h,
            width: 11.h,
            child: Checkbox(
              visualDensity: VisualDensity.compact,
              value: false,
              onChanged: (newValue) {},
              side: const BorderSide(color: Palette.aquayarGrey, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const CustomSpacer(
            flex: 2,
            horizontal: true,
          ),
          Text(
            label,
            style: TextStyle(color: Palette.aquayarGrey, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
