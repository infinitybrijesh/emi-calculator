// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';
import 'dart:math';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/PieChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class RecurringDepositScreen extends StatefulWidget {
  const RecurringDepositScreen({super.key});

  @override
  State<RecurringDepositScreen> createState() => _RecurringDepositScreenState();
}

class _RecurringDepositScreenState extends State<RecurringDepositScreen> {
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
          'Recurring Deposit',
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
                                labelText: "Loan Amount (₹)",
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
                                    labelText: "Loan Terms",
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
                                  calculateRDResult();
                                  setState(() {});
                                  // _handleCalculation();
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
                              Stack(
                                children: [
                                  EMIPieChart(
                                      interestrate:
                                          interestrate.toStringAsFixed(1),
                                      principalrate:
                                          principalrate.toStringAsFixed(1)),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: GestureDetector(
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
                                      child: const Card(
                                        elevation: 2,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.share),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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

  void calculateRDResult() {
    double monthlyInvestment =
        double.parse(_loanamountController.text.replaceAll(',', ''));
    double interestRate = double.parse(_interestrateController.text);
    int timePeriod = int.parse(_loantermsController.text);

    double rate = interestRate / 400;
    int numberOfQuarters = timePeriod * 4;

    double maturityAmount = monthlyInvestment *
        ((pow(1 + rate, numberOfQuarters) - 1) / (1 - pow(1 + rate, -1 / 3)));

    int month = isYear
        ? int.parse(_loantermsController.text) * 12
        : int.parse(_loantermsController.text);
    setState(() {
      totalDeposit =
          double.parse(_loanamountController.text.replaceAll(',', '')) * month;
      this.maturityAmount = maturityAmount;
      totalInterest = maturityAmount - totalDeposit;

      principalrate = (totalDeposit * 100) / maturityAmount;
      interestrate = 100 - principalrate;
    });
  }
}
