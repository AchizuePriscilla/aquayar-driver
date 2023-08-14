import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  const PasswordTextField({super.key, this.controller, required this.label});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  void toggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: _hidePassword,
      label: widget.label,
      controller: widget.controller,
      suffix: PasswordVisibilityIcon(
        onPressed: toggleVisibility,
        value: _hidePassword,
      ),
    );
  }
}
