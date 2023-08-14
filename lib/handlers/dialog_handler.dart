import 'dart:async';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:flutter/material.dart';

///An abstraction of [DialogManager] with no direct dependence on [BuildContext]
abstract class DialogHandler {
  GlobalKey get dialogKey;

  /// Displays a dialog on screen.
  ///
  /// [routeName] is used to look up a dialog's implementation.
  ///
  /// [autoDismiss] when true, implies that the dialog will be shown on screen for [duration]
  /// before being automatically dismissed.
  Future<Object?> showDialog({
    String routeName = basicDialogRoute,
    Duration duration = const Duration(seconds: 3),
    bool autoDismiss = false,
    Object? arguments,
  });

  ///Dismisses current dialog
  void dismissDialog([Object? result]);
}

class DialogHandlerImpl implements DialogHandler {
  late GlobalKey _dialogKey;

  DialogHandlerImpl({GlobalKey? dialogKey}) {
    _dialogKey = dialogKey ?? GlobalKey();
  }

  @override
  GlobalKey get dialogKey => _dialogKey;

  @override
  void dismissDialog([Object? result]) {
    DialogManager.of(dialogKey.currentContext!).dismissDialog(result);
  }

  @override
  Future<Object?> showDialog({
    String routeName = basicDialogRoute,
    Duration duration = const Duration(seconds: 3),
    bool autoDismiss = false,
    Object? arguments,
  }) async {
    return DialogManager.of(dialogKey.currentContext!).showDialog(
      routeName: routeName,
      duration: duration,
      autoDismiss: autoDismiss,
      arguments: arguments,
    );
  }
}
