// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';
import 'dart:math';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PresentValueScreenInOthers extends StatefulWidget {
  const PresentValueScreenInOthers({super.key});

  @override
  State<PresentValueScreenInOthers> createState() =>
      _PresentValueScreenInOthersState();
}

class _PresentValueScreenInOthersState
    extends State<PresentValueScreenInOthers> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _futurevalueController = TextEditingController();
  final TextEditingController _inflationrateController =
      TextEditingController();
  final TextEditingController _loantermsController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isYear = true;
  bool isMonth = false;
  double totalpayment = 0;
  var formatter = NumberFormat('#,##,###');
  String presentValue = '';
  String totalInterest = '';
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
          'Present Value (PV)',
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
                              controller: _futurevalueController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String result =
                                    formatter.format(int.parse(value));
                                _futurevalueController.text = result;
                                _futurevalueController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _futurevalueController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Future Value (₹)",
                                prefix: const Text("Rs. "),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _inflationrateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Inflation Rate (%)",
                                suffix: const Text("%   "),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextFormField(
                                  controller: _loantermsController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Terms",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  ChoiceChip(
                                    label: Text(
                                      " Year ",
                                      style: TextStyle(
                                          color: isYear
                                              ? Appcolor.white
                                              : Appcolor.black),
                                    ),
                                    selectedColor: Appcolor.primaryColor,
                                    selected: isYear,
                                    onSelected: (value) {
                                      setState(() {
                                        isMonth = false;
                                        isYear = !isYear;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  ChoiceChip(
                                    label: Text(
                                      " Month ",
                                      style: TextStyle(
                                          color: isMonth
                                              ? Appcolor.white
                                              : Appcolor.black),
                                    ),
                                    selectedColor: Appcolor.primaryColor,
                                    selected: isMonth,
                                    onSelected: (value) {
                                      setState(() {
                                        isYear = false;
                                        isMonth = !isMonth;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                                    _futurevalueController.clear();
                                    _inflationrateController.clear();
                                    _loantermsController.clear();
                                    isYear = true;
                                    isMonth = false;
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
                                  FocusScope.of(context).unfocus();
                                  _handleCalculation();
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
                  presentValue.isEmpty
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            BigNativeAds(),
                          ],
                        )
                      : const SizedBox(),
                  if (presentValue.isNotEmpty)
                    Column(
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Present Value",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Appcolor.primaryColor),
                                ),
                                Text(
                                  "₹ $presentValue",
                                  style: const TextStyle(
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
                          margin: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Future Value"),
                                            Divider(),
                                            Text("Total Interest"),
                                            Divider(),
                                          ],
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              "₹ ${_futurevalueController.text}"),
                                          const Divider(),
                                          Text(("₹ $totalInterest")),
                                          const Divider(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                      child: Text(
                                          "If an item costs ₹${_futurevalueController.text} after ${_loantermsController.text} yr then it's current price will be ₹$presentValue.",
                                          style: const TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Card(
                                  color: Appcolor.grey200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () async {
                                        clickCountFunction();
                                        await screenshotController
                                            .capture(
                                                pixelRatio:
                                                    MediaQuery.of(context)
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

  void _handleCalculation() {
    if (_futurevalueController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Future value.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_inflationrateController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Inflation Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loantermsController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Terms.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (isYear == false && isMonth == false) {
      showSnackBar(
        context: context,
        message: "Please Select Year Or Month.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double futureValue =
          double.parse(_futurevalueController.text.replaceAll(',', ''));
      double inflationRate =
          double.parse(_inflationrateController.text.replaceAll(',', ''));
      double rate = inflationRate / 100;
      int term = int.parse(_loantermsController.text.replaceAll(',', ''));

      double a = futureValue / pow(1 + rate, term);
      presentValue = a.toStringAsFixed(2);
      double b = futureValue - a;
      totalInterest = b.toStringAsFixed(2);
    }
  }
}
