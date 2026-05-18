import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class SnackbarUtils {
  static void showSnackbar(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 4),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
    );
  }

  static void showErrorSnackbar(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 4),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
    );
  }
}
