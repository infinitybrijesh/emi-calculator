// ignore_for_file: file_names

import 'dart:math';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class FixedDepositScreen extends StatefulWidget {
  const FixedDepositScreen({super.key});

  @override
  State<FixedDepositScreen> createState() => _FixedDepositScreenState();
}

class _FixedDepositScreenState extends State<FixedDepositScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _depositamountController =
      TextEditingController();
  final TextEditingController _interestrateController = TextEditingController();
  final TextEditingController _inflationrateController =
      TextEditingController();
  final TextEditingController _loantermsController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double interestrate = 0;
  double principalrate = 0;
  bool isYear = true;
  bool isMonth = false;
  double totalpayment = 0;
  bool isAdjust = false;
  var formatter = NumberFormat('#,##,###');
  double maturityAmount = 0;
  double totalDeposit = 0;
  double totalInterest = 0;

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
          'Fixed Deposit Cumulative (FD)',
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
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Appcolor.grey200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      value: isAdjust,
                                      onChanged: (value) {
                                        setState(() {
                                          isAdjust = value!;
                                          _inflationrateController.text =
                                              5.toString();
                                        });
                                      },
                                    ),
                                    Text(
                                      "Adjust Inflation",
                                      style: TextStyle(
                                        color: isAdjust
                                            ? Appcolor.black
                                            : Appcolor.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                isAdjust
                                    ? Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        height: 33,
                                        width: 130,
                                        child: TextFormField(
                                          controller: _inflationrateController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 10),
                                            labelText: "Inflation Rate (%)",
                                            suffix: const Text("%   "),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
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
                                    _loantermsController.clear();
                                    _inflationrateController.clear();
                                    isYear = true;
                                    isMonth = false;
                                    principalrate = 0;
                                    interestrate = 0;
                                    isAdjust = false;
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
                  maturityAmount == 0
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            BigNativeAds(),
                          ],
                        )
                      : const SizedBox(),
                  maturityAmount != 0
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
                                        "Maturity Ammount",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Appcolor.primaryColor,
                                            letterSpacing: 0.5),
                                      ),
                                      Text(
                                        "₹ ${formatter.format(maturityAmount)}",
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
                                  const Text("Total Deposit"),
                                  Text(
                                      '₹ ${formatter.format(totalDeposit.round())}'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total interest"),
                                  Text(
                                      '₹ ${formatter.format(totalInterest.round())}'),
                                ],
                              ),
                              const Divider(),
                              // Stack(
                              //   children: [
                              //     EMIPieChart(
                              //         interestrate:
                              //             interestrate.toStringAsFixed(1),
                              //         principalrate:
                              //             principalrate.toStringAsFixed(1)),
                              //     Positioned(
                              //       bottom: 5,
                              //       right: 5,
                              //       child: GestureDetector(
                              //         onTap: () async {
                              //           await screenshotController
                              //               .capture(
                              //                   pixelRatio:
                              //                       MediaQuery.of(context)
                              //                           .devicePixelRatio,
                              //                   delay: const Duration(
                              //                       milliseconds: 10))
                              //               .then((image) async {
                              //             if (image != null) {
                              //               final directory =
                              //                   await getApplicationSupportDirectory();
                              //               final imagePath = await File(
                              //                       '${directory.path}/image.png')
                              //                   .create();
                              //               await imagePath.writeAsBytes(image);
                              //               await Share.shareFiles(
                              //                   [imagePath.path]);
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

  void _handleCalculation() {
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
      double year = 0;
      double rate =
          double.parse(_interestrateController.text.replaceAll(',', '')) / 100;
      isMonth
          ? year =
              (int.parse(_loantermsController.text.replaceAll(',', '')) / 12)
          : year =
              (double.parse(_loantermsController.text.replaceAll(',', '')));
      // isYear
      //     ? month =
      //         (int.parse(_loantermsController.text.replaceAll(',', '')) * 12)
      //     : month = (int.parse(_loantermsController.text.replaceAll(',', '')));
      // double monthlyrate = rate / month;
      maturityAmount =
          double.parse(_depositamountController.text.replaceAll(',', '')) *
              pow(1 + (rate / 1), (1 * year));
      // monthlyintrest = double.parse(monthlyrate.toStringAsFixed(6)) *
      //     double.parse(_depositamountController.text.replaceAll(',', ''));
      totalInterest = maturityAmount -
          double.parse(_depositamountController.text.replaceAll(',', ''));
      totalDeposit =
          double.parse(_depositamountController.text.replaceAll(',', ''));
      maturityAmount =
          double.parse(_depositamountController.text.replaceAll(',', '')) +
              totalInterest;
      // print("cjkvbcjkv " + totalInterest.toString());
      // log("month " + month.toString());
      // log("monthlyrate " + monthlyrate.toString());
      // log("rate " + rate.toString());
      // log("totalInterest " + totalInterest.toString());
      // log("totalDeposit " + totalDeposit.toString());
    }
  }
}
