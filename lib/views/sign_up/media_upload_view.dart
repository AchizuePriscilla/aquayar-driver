import 'package:aquayar_driver/navigation/media_upload_arg.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MediaUploadView extends StatelessWidget {
  final MediaUploadArgs args;
  const MediaUploadView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(context: context),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const CustomSpacer(
                  flex: 2,
                ),
                Text(
                  args.title,
                  style: AquayarTextStyles.h1,
                ),
                Text(
                  args.subtitle,
                  style: AquayarTextStyles.greyBody,
                ),
                const CustomSpacer(
                  flex: 5,
                ),
                Container(
                  height: 30.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.lightGrey,
                      ),
                      borderRadius: BorderRadius.circular(50.w)),
                  child: Center(
                      child: Text(
                    "Sample exterior photo",
                    style:
                        TextStyle(fontSize: 15.sp, color: Palette.aquayarBlack),
                  )),
                ),
                const CustomSpacer(
                  flex: 3,
                ),
                SvgPicture.asset("assets/svgs/media_upload.svg"),
                const CustomSpacer(
                  flex: 3,
                ),
                Button(
                    text: "Save",
                    onPressed: () {
                    
                    })
              ],
            ),
          );
        });
  }
}
