import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class CustomSnackBar {
  static showSuccessSnackBar(
    BuildContext context, {
    required String message,
    int milliseconds = 10000,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.fixed,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        margin: const EdgeInsets.only(bottom: 100.0),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  static showErrorSnackBar(
    BuildContext context, {
    String? message,
    int milliseconds = 5000,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkBackgroundColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: AppColors.greyShade1,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: SelectableText(
                message ?? 'An error occured',
                style: const TextStyle(color: AppColors.greyShade1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
