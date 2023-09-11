// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Colors.blue.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressBar({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
  }
}
