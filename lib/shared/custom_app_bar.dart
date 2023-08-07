import 'package:aquayar_driver/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar {
  final String text;
  final bool implyLeading;
  final List<Widget> actionWidgets;
  final BuildContext context;
  final Color? backgroundCOlor;

  CustomAppBar(
      {Key? key,
      this.text = "",
      this.implyLeading = true,
      this.actionWidgets = const [],
      required this.context,
      this.backgroundCOlor})
      : super(
          key: key,
          leading: implyLeading
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.h,
                    color: Palette.aquayarBlack,
                  ),
                )
              : null,
          automaticallyImplyLeading: implyLeading,
          actions: actionWidgets,
          backgroundColor: backgroundCOlor ?? Palette.aquayarWhite,
          elevation: 0,
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
}
