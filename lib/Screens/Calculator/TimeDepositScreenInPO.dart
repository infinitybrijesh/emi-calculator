// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class TimeDepositScreenInPO extends StatefulWidget {
  const TimeDepositScreenInPO({super.key});

  @override
  State<TimeDepositScreenInPO> createState() => _TimeDepositScreenInPOState();
}

class _TimeDepositScreenInPOState extends State<TimeDepositScreenInPO> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _depositamountController =
      TextEditingController();
  final TextEditingController _interestrateController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double interestrate = 0;
  double principalrate = 0;
  double totalpayment = 0;
  var formatter = NumberFormat('#,##,###');
  double maturityAmount = 0;
  double yearlyintrest = 0;
  double totalInterest = 0;
  String dropdownvalue = '1 year';
  var items = [
    '1 year',
    '2 year',
    '3 year',
    '4 year',
    '5 year',
  ];

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
          'Time Deposit (TD)',
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
                                children: [
                                  const Text(
                                    "Term",
                                    style: TextStyle(color: Appcolor.black),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 14)),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
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
                                    principalrate = 0;
                                    interestrate = 0;
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
                  yearlyintrest == 0
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            BigNativeAds(),
                          ],
                        )
                      : const SizedBox(),
                  yearlyintrest == 0
                      ? const SizedBox()
                      : Card(
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
                                        "Yearly Interest",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolor.primaryColor,
                                            letterSpacing: 0.5),
                                      ),
                                      Text(
                                        "₹ ${formatter.format(yearlyintrest)}",
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
                                  Text(
                                      '₹ ${formatter.format(totalInterest.round())}'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total Amount"),
                                  Text(
                                      '₹ ${formatter.format(totalpayment.round())}'),
                                ],
                              ),
                              const Divider(),
                              // Stack(
                              //   children: [
                              //     EMIPieChart(
                              //         interestrate: interestrate.toStringAsFixed(1),
                              //         principalrate:
                              //             principalrate.toStringAsFixed(1)),
                              //     Positioned(
                              //       bottom: 5,
                              //       right: 5,
                              //       child: GestureDetector(
                              //         onTap: () async {
                              //           await screenshotController
                              //               .capture(
                              //                   pixelRatio: MediaQuery.of(context)
                              //                       .devicePixelRatio,
                              //                   delay:
                              //                       const Duration(milliseconds: 10))
                              //               .then((image) async {
                              //             if (image != null) {
                              //               final directory =
                              //                   await getApplicationSupportDirectory();
                              //               final imagePath = await File(
                              //                       '${directory.path}/image.png')
                              //                   .create();
                              //               await imagePath.writeAsBytes(image);
                              //               await Share.shareFiles([imagePath.path]);
                              //             }
                              //           });
                              //         },
                              //         child: const Card(
                              //           elevation: 2,
                              //           child: Padding(
                              //             padding: EdgeInsets.all(10),
                              //             child: Icon(Icons.share),
                              //           ),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "⦿",
                                    style: TextStyle(
                                        color: Appcolor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.83,
                                    child: Text(
                                        "You Will receive interest Rs. ${yearlyintrest.toStringAsFixed(0)} every year."),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "⦿",
                                    style: TextStyle(
                                        color: Appcolor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.83,
                                    child: Text(
                                        "At the end of the term, you will get your deposit amount Rs. ${_depositamountController.text} back."),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _handleCalculation() {
    if (_depositamountController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_interestrateController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (dropdownvalue.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Select Term.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      maturityAmount = 0;
      yearlyintrest =
          double.parse(_depositamountController.text.replaceAll(',', '')) *
              (double.parse(_interestrateController.text.replaceAll(',', '')) /
                  100);
      totalInterest = yearlyintrest * int.parse(dropdownvalue.split(" ").first);
      totalpayment =
          double.parse(_depositamountController.text.replaceAll(',', '')) +
              totalInterest;
      return yearlyintrest;
    }
    return 0;
  }
}
