// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class MonthlyIncomeSchemeScreenInPO extends StatefulWidget {
  const MonthlyIncomeSchemeScreenInPO({super.key});

  @override
  State<MonthlyIncomeSchemeScreenInPO> createState() =>
      _MonthlyIncomeSchemeScreenInPOState();
}

class _MonthlyIncomeSchemeScreenInPOState
    extends State<MonthlyIncomeSchemeScreenInPO> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _depositamountController =
      TextEditingController();
  final TextEditingController _interestrateController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  double monthlyInterest = 0;
  double totalInterest = 0;
  double totalAmount = 0;

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
          'Monthly Income Scheme (MIS)',
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
                              controller: _depositamountController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _depositamountController.text = retult;
                                _depositamountController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _depositamountController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Deposit Amount (₹)",
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
                              controller: _interestrateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Interest Rate (%)",
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Term",
                                    style: TextStyle(color: Appcolor.black),
                                  ),
                                  Text(
                                    "5 Years",
                                    style: TextStyle(color: Appcolor.black),
                                  ),
                                ],
                              ),
                            ),
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
                                    _depositamountController.clear();
                                    _interestrateController.clear();
                                    monthlyInterest = 0;
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
                                  if (_depositamountController.text.isEmpty) {
                                    showSnackBar(
                                      context: context,
                                      message: "Please Enter Deposite Amount.",
                                      iconData: Icons.error,
                                      isError: true,
                                    );
                                  } else if (_interestrateController
                                      .text.isEmpty) {
                                    showSnackBar(
                                      context: context,
                                      message: "Please Enter Interest Rate.",
                                      iconData: Icons.error,
                                      isError: true,
                                    );
                                  } else {
                                    _handleCalculations();
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
                  monthlyInterest == 0
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            BigNativeAds(),
                          ],
                        )
                      : const SizedBox(),
                  monthlyInterest != 0
                      ? Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(children: [
                              Card(
                                elevation: 2,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Monthly Interest",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolor.primaryColor,
                                            letterSpacing: 0.5),
                                      ),
                                      Text(
                                        "₹ ${formatter.format(monthlyInterest)}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolor.primaryColor,
                                            letterSpacing: 0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total Interest"),
                                  Text('₹ ${formatter.format(totalInterest)}'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total Amount"),
                                  Text('₹ ${formatter.format(totalAmount)}'),
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
                                    child: Text(
                                        "You will receive interest ₹ ${formatter.format(monthlyInterest)} every Month.",
                                        style: const TextStyle(fontSize: 13)),
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
                                    child: Text(
                                        "At the end of the term, you will get your deposit amount ₹ ${_depositamountController.text} back.",
                                        style: const TextStyle(fontSize: 13)),
                                  ),
                                ],
                              ),
                              const Divider(),
                              GestureDetector(
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
                                child: const Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.share),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleCalculations() {
    double deposit =
        double.parse(_depositamountController.text.replaceAll(',', ''));
    double interestRate =
        double.parse(_interestrateController.text.replaceAll(',', ''));
    int years = 5;
    double yInterest = deposit * interestRate / 100;
    double mInterest = yInterest / 12;
    double tInterest = yInterest * years;
    monthlyInterest = mInterest;
    totalInterest = tInterest;
    totalAmount = tInterest + deposit;
  }
}
