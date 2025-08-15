import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, ) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger != null) {
      final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 23),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.blueGrey,
      );
      messenger.showSnackBar(snackBar);
    }
  });
}

