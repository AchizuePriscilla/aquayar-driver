import 'dart:async';
import 'package:aquayar_driver/shared/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatefulWidget {
  final StreamController<ErrorAnimationType> errorController;
  final TextEditingController controller;
  final Function(String) validator;
  final int length;
  final bool hasError;
  const PinCodeFields({
    Key? key,
    required this.controller,
    required this.validator,
    required this.errorController,
    this.hasError = false,
    this.length = 4,
  }) : super(key: key);

  @override
  PinCodeFieldsState createState() => PinCodeFieldsState();
}

class PinCodeFieldsState extends State<PinCodeFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      child: PinCodeTextField(
        autovalidateMode: AutovalidateMode.disabled,
        appContext: context,
        length: widget.length,
        animationType: AnimationType.fade,
        validator: (v) {
          return widget.validator(v!);
        },
        pinTheme: PinTheme(
          selectedColor: Palette.lightGrey,
          inactiveColor: Palette.lightGrey,
          shape: PinCodeFieldShape.underline,
          fieldHeight: 40.h,
          fieldWidth: 55.w,
          activeColor: widget.hasError ? Colors.red : Palette.aquayarGrey,
        ),
        cursorColor: Palette.aquayarBlack,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: false,
        errorAnimationController: widget.errorController,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
