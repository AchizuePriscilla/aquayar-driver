import 'package:aquayar_driver/handlers/dialog_handler.dart';
import 'package:aquayar_driver/navigation/finish_order_dialog_args.dart';
import 'package:aquayar_driver/shared/dialog_card.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogRouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Widget? onGenerateDialogRoute(DialogSettings settings) {
    switch (settings.name) {
      case basicDialogRoute:
        final request = settings.arguments;
        if (request != null && request is FinishOrderDialogArgs) {
          return DialogCard(
            request: request,
          );
        }
        break;

      default:
        final request = settings.arguments;
        if (request != null && request is FinishOrderDialogArgs) {
          return DialogCard(
            request: request,
          );
        }
        break;
    }
    return _errorDialog(settings);
  }

  static Widget _errorDialog(DialogSettings settings) {
    return DialogBuilder(
      builder: (dialogKey) {
        return Container(
          key: dialogKey,
          height: 250.h,
          width: 250.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => locator<DialogHandler>().dismissDialog(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
              SizedBox(height: 10.h),
              const Spacer(),
              Center(
                child: Text(
                  "No dialog defined for ${settings.name}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              TextButton(
                onPressed: () => locator<DialogHandler>().dismissDialog(),
                child: const Text("Ok"),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
