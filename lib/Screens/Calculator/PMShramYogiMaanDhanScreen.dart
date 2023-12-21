// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PMShramYogiMaanDhanScreen extends StatefulWidget {
  const PMShramYogiMaanDhanScreen({super.key});

  @override
  State<PMShramYogiMaanDhanScreen> createState() => _PMShramYogiMaanDhanScreenState();
}

class _PMShramYogiMaanDhanScreenState extends State<PMShramYogiMaanDhanScreen> {
   ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 1,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child:
                const Icon(Icons.arrow_back_outlined, color: Appcolor.black)),
        title: const Text(
          'PM Shram Yogi Maan Dhan (PMSYMD)',
          style: TextStyle(
              color: Appcolor.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              letterSpacing: 0.5),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
      ),
      body: SingleChildScrollView(
        child: Screenshot(
          controller: screenshotController,
          child: Container(
            color: Appcolor.white,
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Your Age",
                                hintText: "18 to 40 year",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: const [Text("You want to receive Monthly Pension"), Text("Rs. 3,000")],
                          ),
                          const Divider(),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: const [Text("You will pay your Contributions"), Text("Every Month")],
                          ),
                          const Divider(),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: const [Text("Retirement Age:"), Text("60 Years")],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolor.red400),
                                onPressed: () {},
                                child: const Text(
                                  "    Reset    ",
                                  style: TextStyle(color: Appcolor.white),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolor.primaryColor),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                },
                                child: const Text(
                                  "Calculate",
                                  style: TextStyle(color: Appcolor.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Condition to be applied here for results.

                  Column(
                      children: [
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Monthly Contribution",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Appcolor.primaryColor),
                                ),
                                Text(
                                  "₹...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Appcolor.primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Contribution Period"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Your Contribution(A)"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Government Contribution(B)"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Total Contribution(A+B)"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Monthly Pension"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Family Pension"),
                                        Text("₹..."),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "You have to pay ₹... every month till you reach 60 years of age.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "The Government will also pay matching amount of ₹... every month till you reach 60 years of age.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "You will pay a total of ₹... during the contribution period of 35 years.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "The Government will also pay a total of ₹... during the contribution period of 35 year.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "After retirement, you will receive guaranteed monthly pension of Rs. ... till the end of your life.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "After that, your spouse will receive guaranteed family pension of Rs. ... every month till the end of her/his life.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Appcolor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "After that , family pension will be stopped. Any remaining amount in your account will be given back to the Government.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Card(
                                  color: Appcolor.grey200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () async {
                                      clickCountFunction();
                                      await screenshotController
                                          .capture(
                                              pixelRatio: MediaQuery.of(context)
                                                  .devicePixelRatio,
                                              delay: const Duration(
                                                  milliseconds: 10))
                                          .then((image) async {
                                        if (image != null) {
                                          final directory =
                                              await getApplicationSupportDirectory();
                                          final imagePath = await File(
                                                  '${directory.path}/image.png')
                                              .create();
                                          await imagePath.writeAsBytes(image);
                                          await Share.shareFiles(
                                              [imagePath.path]);
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 5),
                                      child: Row(children: [
                                        SvgPicture.asset(
                                          'assets/svg/jpg.svg',
                                          height: 30,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          "JPG",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolor.primaryColor,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}