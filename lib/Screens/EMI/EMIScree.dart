// ignore_for_file: implementation_imports, file_names, deprecated_member_use, curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:math';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/PieChart.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:emi_calculator/Widgets/ViewEMIDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class EMIScreen extends StatefulWidget {
  const EMIScreen({super.key});

  @override
  State<EMIScreen> createState() => _EMIScreenState();
}

class _EMIScreenState extends State<EMIScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _loanamountController = TextEditingController();
  final TextEditingController _interestrateController = TextEditingController();
  final TextEditingController _loantermsController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _emiResult = "";
  String interestrate = "";
  String principalrate = "";
  bool isYear = true;
  bool isMonth = false;
  double totalpayment = 0;
  var formatter = NumberFormat('#,##,###');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                                  isYear = true;
                                  isMonth = false;
                                  _emiResult = "";
                                  principalrate = '';
                                  interestrate = '';
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
                _emiResult.isEmpty
                    ? Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          BigNativeAds(),
                        ],
                      )
                    : const SizedBox(),
                if (_emiResult.isNotEmpty)
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
                                "EMI",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Appcolor.primaryColor),
                              ),
                              Text(
                                "₹ ${formatter.format(double.parse(_emiResult).round())}",
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
                        margin:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text("Loan Amount"),
                                          Divider(),
                                          Text("Total Interest"),
                                          Divider(),
                                          Text("Total Payment"),
                                          Divider(),
                                          Text("No of Payment"),
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
                                        Text("₹ ${_loanamountController.text}"),
                                        const Divider(),
                                        Text(
                                            ("₹ ${formatter.format(totalpayment.round() - int.parse(_loanamountController.text.replaceAll(",", '')))}")),
                                        const Divider(),
                                        Text(
                                            "₹ ${formatter.format(totalpayment.round())}"),
                                        const Divider(),
                                        Text(isYear
                                            ? "${int.parse(_loantermsController.text) * 12}"
                                            : "${int.parse(_loantermsController.text)}"),
                                        const Divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ViewEMIDetailPage(
                                                loanamount: int.parse(
                                                    _loanamountController.text
                                                        .replaceAll(",", '')),
                                                emi: double.parse(_emiResult),
                                                loanrate: double.parse(
                                                    _interestrateController
                                                        .text),
                                                months: isYear
                                                    ? int.parse(
                                                            _loantermsController
                                                                .text) *
                                                        12
                                                    : int.parse(
                                                        _loantermsController.text)),
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
                            ],
                          ),
                        ),
                      ),
                      EMIPieChart(
                          interestrate: interestrate,
                          principalrate: principalrate),
                    ],
                  ),
              ],
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
        message: "Please Enter Loan Amount.",
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
        message: "Please Enter Loan Terms.",
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
      double A = 0.0;
      int P =
          int.parse(_loanamountController.text.replaceAll(",", "").toString());
      double x = double.parse(_interestrateController.text);
      double r = x / 12 / 100;
      int n = isYear
          ? int.parse(_loantermsController.text) * 12
          : int.parse(_loantermsController.text);

      A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

      _emiResult = A.toStringAsFixed(2);
      double total = 0;
      if (isYear)
        for (var i = 0; i < int.parse(_loantermsController.text); i++) {
          for (var j = 0; j < 12; j++) {
            total = total + double.parse(_emiResult);
          }
        }
      else if (isMonth)
        for (var i = 0; i < int.parse(_loantermsController.text); i++) {
          total = total + double.parse(_emiResult);
        }
      totalpayment = isYear
          ? double.parse(_emiResult) * int.parse(_loantermsController.text) * 12
          : double.parse(_emiResult) * int.parse(_loantermsController.text);
      double pri = P * 100 / total;
      double intere = 100 - pri;
      principalrate = pri.toStringAsFixed(2);
      interestrate = intere.toStringAsFixed(2);
      setState(() {});
    }
  }
}
