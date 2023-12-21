// ignore_for_file: file_names

import 'dart:math';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class GoalCalculatorScreen extends StatefulWidget {
  const GoalCalculatorScreen({super.key});

  @override
  State<GoalCalculatorScreen> createState() => _GoalCalculatorScreenState();
}

class _GoalCalculatorScreenState extends State<GoalCalculatorScreen> {
  final TextEditingController _targetAmountController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _returnRateController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  double targetAmount = 5000000;
  double years = 12;
  double returnrate = 7;
  double monthlyDeposit = 0;
  double monthlyTotalDeposit = 0;
  double monthlyTotalReturn = 0;
  double monthlyTotalMaturityAmount = 0;

  double oneTimeDeposit = 0;
  double oneTimeTotalDeposit = 0;
  double oneTimeTotalReturn = 0;
  double oneTimeTotalMaturityAmount = 0;

  void calculateGoal(
      {required double goalAmount,
      required double annualInterestRate,
      required int investmentDuration}) {
    int totalMonths = investmentDuration * 12;
    double monthlyInterestRate = annualInterestRate / 12 / 100;

    monthlyDeposit = goalAmount *
        (monthlyInterestRate +
            (monthlyInterestRate /
                (pow(1 + monthlyInterestRate, totalMonths) - 1)));
    oneTimeDeposit = goalAmount / pow(1 + monthlyInterestRate, totalMonths);

    monthlyTotalDeposit = monthlyDeposit * totalMonths;
    monthlyTotalReturn = monthlyTotalDeposit - goalAmount;
    monthlyTotalMaturityAmount = goalAmount + monthlyTotalReturn;

    oneTimeTotalDeposit = oneTimeDeposit * totalMonths;
    oneTimeTotalReturn = oneTimeTotalDeposit - goalAmount;
    oneTimeTotalMaturityAmount = goalAmount + oneTimeTotalReturn;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _targetAmountController.text = formatter.format(targetAmount);
    _yearController.text = years.toString();
    _returnRateController.text = returnrate.toStringAsFixed(2);
    calculateGoal(
        goalAmount: double.parse(
            _targetAmountController.text.replaceAll(',', '').toString()),
        annualInterestRate: double.parse(_returnRateController.text),
        investmentDuration: int.parse(_yearController.text.split(".").first));
  }

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
          'Goal Calculator',
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
                              controller: _targetAmountController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _targetAmountController.text = retult;
                                _targetAmountController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _targetAmountController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Target Amount (₹)",
                                prefix: const Text("Rs."),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Slider(
                            min: 1000000,
                            max: 50000000,
                            value: targetAmount,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                targetAmount = value;
                                _targetAmountController.text =
                                    targetAmount.toStringAsFixed(0);
                                calculateGoal(
                                    goalAmount: double.parse(
                                        _targetAmountController.text
                                            .replaceAll(',', '')
                                            .toString()),
                                    annualInterestRate: double.parse(
                                        _returnRateController.text),
                                    investmentDuration: int.parse(
                                        _yearController.text.split(".").first));
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _yearController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Years",
                                prefix: const Text("Yr."),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Slider(
                            min: 1,
                            max: 40,
                            value: years,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                years = value;
                                _yearController.text = years.toStringAsFixed(0);
                                calculateGoal(
                                    goalAmount: double.parse(
                                        _targetAmountController.text
                                            .replaceAll(',', '')
                                            .toString()),
                                    annualInterestRate: double.parse(
                                        _returnRateController.text),
                                    investmentDuration: int.parse(
                                        _yearController.text.split(".").first));
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _returnRateController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Return Rate (%)",
                                prefix: const Text("%."),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Slider(
                            min: 1,
                            max: 40,
                            value: returnrate,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                returnrate = value;
                                _returnRateController.text =
                                    returnrate.toStringAsFixed(0);
                                calculateGoal(
                                    goalAmount: double.parse(
                                        _targetAmountController.text
                                            .replaceAll(',', '')
                                            .toString()),
                                    annualInterestRate: double.parse(
                                        _returnRateController.text),
                                    investmentDuration: int.parse(
                                        _yearController.text.split(".").first));
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Monthly Deposit",
                                  style: TextStyle(
                                    color: Appcolor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Text(
                                  "One Time Deposit",
                                  style: TextStyle(
                                    color: Appcolor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "₹ ${formatter.format(monthlyDeposit)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "₹ ${formatter.format(oneTimeDeposit)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Total Deposit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "₹ ${formatter.format(monthlyTotalDeposit)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "₹ ${formatter.format(oneTimeTotalDeposit)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Total Return",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "₹ ${formatter.format(monthlyTotalReturn)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "₹ ${formatter.format(oneTimeTotalReturn)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Maturity Amount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "₹ ${formatter.format(monthlyTotalMaturityAmount)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "₹ ${formatter.format(oneTimeTotalMaturityAmount)}",
                                style: TextStyle(
                                  color: Appcolor.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
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
