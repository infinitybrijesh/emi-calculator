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

class SimpleInterestScreenInOthers extends StatefulWidget {
  const SimpleInterestScreenInOthers({super.key});

  @override
  State<SimpleInterestScreenInOthers> createState() =>
      _SimpleInterestScreenInOthersState();
}

class _SimpleInterestScreenInOthersState
    extends State<SimpleInterestScreenInOthers> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _loanamountController = TextEditingController();
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
  String totalInterest = '';
  String simpleInterest = "";

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
          'Simple Interest (SI)',
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
                              controller: _loanamountController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _loanamountController.text = retult;
                                _loanamountController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _loanamountController.text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Amount (₹)",
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
                                      "Regular Deposit",
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
                                    _loanamountController.clear();
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
                  simpleInterest.isEmpty
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            BigNativeAds(),
                          ],
                        )
                      : const SizedBox(),
                  simpleInterest.isNotEmpty
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
                                        "₹ $simpleInterest",
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
                                  Text('₹ ${_loanamountController.text}'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total interest"),
                                  Text('₹ $totalInterest'),
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

  void _handleCalculation() {
    if (_loanamountController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_interestrateController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Interest Rate.",
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
      double amount =
          double.parse(_loanamountController.text.replaceAll(',', ''));
      double interest =
          double.parse(_interestrateController.text.replaceAll(',', ''));
      int term = int.parse(_loantermsController.text.replaceAll(',', ''));

      double a = amount + (amount * interest * term) / 100;
      double b = a - amount;
      simpleInterest = a.toStringAsFixed(2);
      totalInterest = b.toStringAsFixed(2);
    }
  }
}
