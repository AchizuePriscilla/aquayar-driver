import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final Function(dynamic) onchanged;
  final bool hideUnderline;
  final T? selectedItem;

  const CustomDropDown({
    Key? key,
    this.label,
    this.hint,
    required this.items,
    required this.onchanged,
    this.hideUnderline = true,
    this.selectedItem,
  }) : super(key: key);

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  Object? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  String get _label => widget.label ?? "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_label.isNotEmpty) ...{
          Text(
            _label,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          const CustomSpacer(
            flex: 1,
          ),
        },
        SizedBox(
          height: 40.h,
          child: DropdownButtonFormField<Object?>(
            dropdownColor: Palette.offWhite,
            borderRadius: BorderRadius.circular(20.w),
            elevation: 0,
            focusColor: Palette.aquayarBlack,
            icon: const Icon(Icons.expand_more),
            hint: Text(
              widget.hint ?? 'Select',
              style: TextStyle(fontSize: 14.sp, color: Palette.aquayarGrey),
            ),
            value: _selectedItem,
            items: widget.items,
            style: TextStyle(fontSize: 14.sp, color: Palette.aquayarGrey),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
              widget.onchanged(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: 20.w, right: 10.w, top: 9.h, bottom: 9.h),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
