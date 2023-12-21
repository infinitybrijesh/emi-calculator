// ignore_for_file: file_names

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String message,
    required IconData iconData,
    required bool isError,
     Color iconColor = Appcolor.white}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
    duration: const Duration(milliseconds: 1200),
    backgroundColor: isError ? Colors.red : Colors.green,
    width: 340.0,
    padding: const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 8.0,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
