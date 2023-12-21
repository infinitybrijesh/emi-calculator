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

class SIPScreen extends StatefulWidget {
  const SIPScreen({super.key});

  @override
  State<SIPScreen> createState() => _SIPScreenState();
}

class _SIPScreenState extends State<SIPScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _monthlyDepositController =
      TextEditingController();
  final TextEditingController _returnrateController = TextEditingController();
  final TextEditingController _annualIncrementController =
      TextEditingController();
  final TextEditingController _inflationrateController =
      TextEditingController();
  final TextEditingController _termsController = TextEditingController();
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
                              controller: _monthlyDepositController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _monthlyDepositController.text = retult;
                                _monthlyDepositController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _monthlyDepositController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Monthly Deposit (₹)",
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
                              controller: _returnrateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Return Rate (%)",
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
                                  controller: _termsController,
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
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _annualIncrementController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _annualIncrementController.text = retult;
                                _annualIncrementController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _annualIncrementController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Annual Increment (Optional)",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
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
                                    _monthlyDepositController.clear();
                                    _returnrateController.clear();
                                    _termsController.clear();
                                    _inflationrateController.clear();
                                    _annualIncrementController.clear();
                                    maturityAmount = 0;
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
                                  _handleCalculations();
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
                      ? Column(
                          children: [
                            Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Maturity Amount",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Appcolor.primaryColor),
                                    ),
                                    Text(
                                      "₹ ${formatter.format(maturityAmount)}",
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
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text("Total Deposit"),
                                                Divider(),
                                                Text("Total Interest"),
                                              ],
                                            )),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "₹ ${formatter.format(totalDeposit)}"),
                                              const Divider(),
                                              Text(
                                                  ("₹ ${formatter.format(totalInterest)}")),
                                            ],
                                          ),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                await imagePath
                                                    .writeAsBytes(image);
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

  _handleCalculations() {
    if (_monthlyDepositController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_returnrateController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_termsController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Terms.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double monthlyInvestment =
          double.parse(_monthlyDepositController.text.replaceAll(",", ""));
      double interestRate = double.parse(_returnrateController.text);
      double investmentPeriod =
          double.parse(_termsController.text.replaceAll(",", ""));
      double i = interestRate / 12 / 100; // Monthly interest rate
      int n = investmentPeriod.toInt() * 12; // Total number of months

      double numerator = (pow(1 + i, n) - 1) / i;

      maturityAmount = monthlyInvestment * numerator * (1 + i);
      totalInterest = maturityAmount -
          (monthlyInvestment * investmentPeriod * (isYear ? 12 : 0));
      totalDeposit = maturityAmount - totalInterest;
      setState(() {});
    }
  }
}
