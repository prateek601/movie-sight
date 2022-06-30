import 'package:flutter/material.dart';

class Toast {
  Toast._privateConstructor();

  static showToast({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
