// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:emi_calculator/Widgets/ViewPMDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PMJeevanJyotiBimaScreen extends StatefulWidget {
  const PMJeevanJyotiBimaScreen({super.key});

  @override
  State<PMJeevanJyotiBimaScreen> createState() =>
      _PMJeevanJyotiBimaScreenState();
}

class _PMJeevanJyotiBimaScreenState extends State<PMJeevanJyotiBimaScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _iscalculate = false;
  var formatter = NumberFormat('#,##,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
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
          'PM Jeevan Jyoti Bima (PMJJB)',
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
        // actions: const [
        //   Icon(Icons.info, color: Appcolor.black),
        //   SizedBox(
        //     width: 15,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            value.isEmpty ? _iscalculate = false : null;
                          });
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: "Enter Your Age",
                          labelStyle: TextStyle(
                              color: _ageController.text.isEmpty
                                  ? Appcolor.primaryColor
                                  : int.parse(_ageController.text) < 18 ||
                                          int.parse(_ageController.text) > 55
                                      ? Appcolor.red
                                      : Appcolor.primaryColor),
                          prefix: const Text("Age. "),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: _ageController.text.isEmpty
                                      ? Appcolor.primaryColor
                                      : int.parse(_ageController.text) < 18 ||
                                              int.parse(_ageController.text) >
                                                  55
                                          ? Appcolor.red
                                          : Appcolor.primaryColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    _ageController.text.isEmpty
                        ? const SizedBox()
                        : int.parse(_ageController.text) < 18
                            ? const Text(
                                'Enter Age Greater Than 17',
                                style: TextStyle(color: Appcolor.red),
                              )
                            : int.parse(_ageController.text) > 55
                                ? const Text("Enter Age Less Than 55",
                                    style: TextStyle(color: Appcolor.red))
                                : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Life Insurance Cover :"),
                        Text("Rs.2 Lakh"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Cover available till :"),
                        Text("55 Years of Age"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.red400),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _ageController.clear();
                              _iscalculate = false;
                            });
                          },
                          child: const Text(
                            "    Reset    ",
                            style: TextStyle(color: Appcolor.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.primaryColor),
                          onPressed: () {
                            if (_ageController.text.isEmpty) {
                              showSnackBar(
                                context: context,
                                message: "Please Enter Your Age.",
                                iconData: Icons.error,
                                isError: true,
                              );
                            } else {
                              _ageController.text.isEmpty ||
                                      int.parse(_ageController.text) < 18 ||
                                      int.parse(_ageController.text) > 55
                                  ? null
                                  : FocusScope.of(context).unfocus();
                              // _handleCalculation();
                              _ageController.text.isEmpty ||
                                      int.parse(_ageController.text) < 18 ||
                                      int.parse(_ageController.text) > 55
                                  ? null
                                  : setState(() {
                                      _iscalculate = true;
                                    });
                            }
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
          ),
          !_iscalculate && _ageController.text.isEmpty
              ? Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    BigNativeAds(),
                  ],
                )
              : const SizedBox(),
          _iscalculate && _ageController.text.isNotEmpty
              ? Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Yearly Premium",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.primaryColor,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "₹ 330",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.primaryColor,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Premium Paying Period"),
                          Text("${70 - int.parse(_ageController.text)}"),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Premium"),
                          Text(
                              "₹ ${formatter.format(330 * (55 - int.parse(_ageController.text)))}"),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: const Text(
                                "You need to pay the premium amount ₹ 330/-every year to get accident insurance cover of Rs.2 lakh/-."),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: const Text(
                                "You can renew the policy every year till you reach 55 years of age."),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(
                                "So, you will be paying a total of ₹ ${formatter.format(330 * (55 - int.parse(_ageController.text)))}/- during your  premium paying period of ${55 - int.parse(_ageController.text)} years."),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: const Text(
                                "Your nominees or you (as the case may be) will get Rs.2 Lakh/- in case of your death or disability due to accident during the premium paying period."),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                          delay:
                                              const Duration(milliseconds: 10))
                                      .then((image) async {
                                    if (image != null) {
                                      final directory =
                                          await getApplicationSupportDirectory();
                                      final imagePath = await File(
                                              '${directory.path}/image.png')
                                          .create();
                                      await imagePath.writeAsBytes(image);
                                      await Share.shareFiles([imagePath.path]);
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
                            Card(
                              color: Appcolor.grey200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  clickCountFunction();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewPMDetailPage(
                                      screen: 'PMJJB',
                                      months: int.parse(_ageController.text),
                                    ),
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Row(children: [
                                    SvgPicture.asset(
                                      'assets/svg/details.svg',
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      "View Details",
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
                          ]),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
                  ),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }
}
