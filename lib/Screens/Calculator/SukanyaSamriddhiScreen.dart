// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use, non_constant_identifier_names

import 'dart:io';

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

class SukanyaSamriddhiScreen extends StatefulWidget {
  const SukanyaSamriddhiScreen({super.key});

  @override
  State<SukanyaSamriddhiScreen> createState() => _SukanyaSamriddhiScreenState();
}

class _SukanyaSamriddhiScreenState extends State<SukanyaSamriddhiScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _depositAmountController =
      TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  String dropdownvalue6 = 'Monthly';
  double maturityAmount = 0.0;
  double totalDeposit = 0.0;
  double totalInterest = 0.0;
  var items4 = [
    'Monthly',
    'Bi-Monthly',
    'Quarterly',
    'Thrice Yearly',
    'Half Yearly',
    'Yearly',
  ];
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
          'Sukanya Samriddhi Account (SSA)',
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
                        controller: _depositAmountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          String retult = formatter.format(int.parse(value));
                          _depositAmountController.text = retult;
                          _depositAmountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset:
                                      _depositAmountController.text.length));
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 20),
                          labelText: "Deposit Amount (₹)",
                          prefix: const Text("Rs. "),
                          suffix: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: dropdownvalue6,
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child:
                                    Icon(Icons.keyboard_arrow_down, size: 20),
                              ),
                              items: items4.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(items,
                                        style: const TextStyle(fontSize: 14)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue6 = newValue!;
                                });
                              },
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: _interestRateController,
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: "Interest Rate (%)",
                          suffix: const Text("%   "),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Deposit Period"),
                        Text("15 Years"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Maturity Period"),
                        Text("21 Years"),
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
                              _depositAmountController.clear();
                              _interestRateController.clear();
                              maturityAmount = 0;
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
              : SizedBox(),
          maturityAmount == 0
              ? SizedBox()
              : Column(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Maturity Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Appcolor.primaryColor),
                            ),
                            Text(
                              "₹ ${formatter.format(maturityAmount)}",
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
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "₹ ${formatter.format(totalDeposit)}"),
                                      Divider(),
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
                                width: 100,
                                height: 40,
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
        ]),
      ),
    );
  }

  double _handleCalculation() {
    if (_depositAmountController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_interestRateController.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double principalAmount =
          double.parse(_depositAmountController.text.replaceAll(',', ''));
      maturityAmount = 0;

      int limit = 0;

      dropdownvalue6 == "Monthly"
          ? limit = 180
          : dropdownvalue6 == "Bi-Monthly"
              ? limit = 90
              : dropdownvalue6 == "Quarterly"
                  ? limit = 60
                  : dropdownvalue6 == "Thrice Yearly"
                      ? limit = 45
                      : dropdownvalue6 == "Half Yearly"
                          ? limit = 30
                          : limit = 15;
      totalDeposit =
          (double.parse(_depositAmountController.text.replaceAll(',', ''))) *
              limit;
      for (int year = 1; year <= limit; year++) {
        // log("principalAmount  " + principalAmount.toString());
        double annualInterest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100);
        double monthlyInterest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                12);
        double BimonthlyInterest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                6);
        double quarterlyIntrest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                4);
        double thriceyearlyintrest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                3);
        double halfyearlyintrest = double.parse(
                principalAmount.toStringAsFixed(2)) *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                2);
        // log("monthlyInterest  " + monthlyInterest.toString());
        maturityAmount +=
            (double.parse(_depositAmountController.text.replaceAll(',', ''))) +
                (dropdownvalue6 == "Monthly"
                    ? double.parse(monthlyInterest.toStringAsFixed(2))
                    : dropdownvalue6 == "Bi-Monthly"
                        ? double.parse(BimonthlyInterest.toStringAsFixed(2))
                        : dropdownvalue6 == "Quarterly"
                            ? double.parse(quarterlyIntrest.toStringAsFixed(2))
                            : dropdownvalue6 == "Thrice Yearly"
                                ? double.parse(
                                    thriceyearlyintrest.toStringAsFixed(2))
                                : dropdownvalue6 == "Half Yearly"
                                    ? double.parse(
                                        halfyearlyintrest.toStringAsFixed(2))
                                    : double.parse(
                                        annualInterest.toStringAsFixed(2)));
        // log("maturityAmount  " + maturityAmount.toString());
        principalAmount += (double.parse(
                _depositAmountController.text.replaceAll(',', ''))) +
            (dropdownvalue6 == "Monthly"
                ? double.parse(monthlyInterest.toStringAsFixed(2))
                : dropdownvalue6 == "Bi-Monthly"
                    ? double.parse(BimonthlyInterest.toStringAsFixed(2))
                    : dropdownvalue6 == "Quarterly"
                        ? double.parse(quarterlyIntrest.toStringAsFixed(2))
                        : dropdownvalue6 == "Thrice Yearly"
                            ? double.parse(
                                thriceyearlyintrest.toStringAsFixed(2))
                            : dropdownvalue6 == "Half Yearly"
                                ? double.parse(
                                    halfyearlyintrest.toStringAsFixed(2))
                                : double.parse(annualInterest.toStringAsFixed(
                                    2))); // Add the interest and contribution to the principal for the next year
        // log("principalAmount  " + principalAmount.toString());
      }
      int limitsecond = 0;
      dropdownvalue6 == "Monthly"
          ? limitsecond = 72
          : dropdownvalue6 == "Bi-Monthly"
              ? limitsecond = 36
              : dropdownvalue6 == "Quarterly"
                  ? limitsecond = 24
                  : dropdownvalue6 == "Thrice Yearly"
                      ? limitsecond = 18
                      : dropdownvalue6 == "Half Yearly"
                          ? limitsecond = 12
                          : limitsecond = 6;

      for (var i = 0; i < limitsecond; i++) {
        // log("maturityAmount last " + maturityAmount.toString());
        double annualInterest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100);
        double monthlyInterest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                12);
        double BimonthlyInterest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                6);
        double quarterlyIntrest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                4);
        double thriceyearlyintrest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                3);
        double halfyearlyintrest = maturityAmount *
            (double.parse(_interestRateController.text.replaceAll(',', '')) /
                100 /
                2);
        // log("monthlyInterest last  " + monthlyInterest.toString());
        maturityAmount += (dropdownvalue6 == "Monthly"
            ? double.parse(monthlyInterest.toStringAsFixed(2))
            : dropdownvalue6 == "Bi-Monthly"
                ? double.parse(BimonthlyInterest.toStringAsFixed(2))
                : dropdownvalue6 == "Quarterly"
                    ? double.parse(quarterlyIntrest.toStringAsFixed(2))
                    : dropdownvalue6 == "Thrice Yearly"
                        ? double.parse(thriceyearlyintrest.toStringAsFixed(2))
                        : dropdownvalue6 == "Half Yearly"
                            ? double.parse(halfyearlyintrest.toStringAsFixed(2))
                            : double.parse(annualInterest.toStringAsFixed(2)));
        // log("maturityAmount last " + maturityAmount.toString());
      }
      totalInterest = maturityAmount - totalDeposit;
      return maturityAmount;
    }
    return 0;
  }
}
