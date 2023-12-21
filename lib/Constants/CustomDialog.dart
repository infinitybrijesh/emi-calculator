// ignore_for_file: file_names

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatelessWidget {
  final String title;

  const CustomDialog({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, title),
    );
  }

  Widget contentBox(BuildContext context, String title) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          margin: const EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Text(
                "Feature Unavailable",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "$title is currently unavailable for this app.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.5,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Perform delete action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.secondarycolor,
                    ),
                    child: const Text(
                      "Okay!",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(width: 16.0),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Perform delete action
                  //     Navigator.of(context).pop();
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Theme.of(context).colorScheme.secondary,
                  //   ),
                  //   child: Text("Delete"),
                  // ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -16.0,
          left: 16.0,
          right: 16.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 3,
                  color: Appcolor.primaryColor,
                ),
                shape: BoxShape.circle),
            height: 80.0,
            width: 80.0,
            child: Lottie.asset('assets/lottie/Maintenance.json'),
          ),
        ),
      ],
    );
  }
}
