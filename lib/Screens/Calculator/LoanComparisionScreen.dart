// ignore_for_file: curly_braces_in_flow_control_structures, file_names, non_constant_identifier_names

import 'dart:io';
import 'dart:math';

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

class LoanComparisionScreen extends StatefulWidget {
  const LoanComparisionScreen({super.key});

  @override
  State<LoanComparisionScreen> createState() => _LoanComparisionScreenState();
}

class _LoanComparisionScreenState extends State<LoanComparisionScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  final TextEditingController _loan1loanamountController =
      TextEditingController();
  final TextEditingController _loan1interestrateController =
      TextEditingController();
  final TextEditingController _loan1loantermsController =
      TextEditingController();
  final TextEditingController _loan2loanamountController =
      TextEditingController();
  final TextEditingController _loan2interestrateController =
      TextEditingController();
  final TextEditingController _loan2loantermsController =
      TextEditingController();
  String _loan1emiResult = "";
  double loan1totalpayment = 0;
  String _loan2emiResult = "";
  double loan2totalpayment = 0;

  bool isYearloan1 = true;
  bool isMonthloan1 = false;
  bool isYearloan2 = true;
  bool isMonthloan2 = false;
  bool isloading = false;
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
          'Loan Comparision',
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
      body: Screenshot(
        controller: screenshotController,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Card(
              elevation: 2,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Loan 1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 15),
                          ),
                          Text(
                            "Loan 2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .44,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      controller: _loan1loanamountController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        String retult =
                                            formatter.format(int.parse(value));
                                        _loan1loanamountController.text =
                                            retult;
                                        _loan1loanamountController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset:
                                                        _loan1loanamountController
                                                            .text.length));
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Loan Amount (₹)",
                                        prefix: const Text("Rs. "),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      controller: _loan1interestrateController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Interest Rate (%)",
                                        suffix: const Text("%   "),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      controller: _loan1loantermsController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Loan Terms",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ChoiceChip(
                                        label: Text(
                                          " Year ",
                                          style: TextStyle(
                                              color: isYearloan1
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isYearloan1,
                                        onSelected: (value) {
                                          setState(() {
                                            isMonthloan1 = false;
                                            isYearloan1 = !isYearloan1;
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
                                              color: isMonthloan1
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isMonthloan1,
                                        onSelected: (value) {
                                          setState(() {
                                            isYearloan1 = false;
                                            isMonthloan1 = !isMonthloan1;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .44,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      controller: _loan2loanamountController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        String retult =
                                            formatter.format(int.parse(value));
                                        _loan2loanamountController.text =
                                            retult;
                                        _loan2loanamountController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset:
                                                        _loan2loanamountController
                                                            .text.length));
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Loan Amount (₹)",
                                        prefix: const Text("Rs. "),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      controller: _loan2interestrateController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Interest Rate (%)",
                                        suffix: const Text("%   "),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      controller: _loan2loantermsController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 10),
                                        labelText: "Loan Terms",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ChoiceChip(
                                        label: Text(
                                          " Year ",
                                          style: TextStyle(
                                              color: isYearloan2
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isYearloan2,
                                        onSelected: (value) {
                                          setState(() {
                                            isMonthloan2 = false;
                                            isYearloan2 = !isYearloan2;
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
                                              color: isMonthloan2
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isMonthloan2,
                                        onSelected: (value) {
                                          setState(() {
                                            isYearloan2 = false;
                                            isMonthloan2 = !isMonthloan2;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.red400),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _loan1loanamountController.clear();
                              _loan1interestrateController.clear();
                              _loan1loantermsController.clear();
                              _loan2loanamountController.clear();
                              _loan2interestrateController.clear();
                              _loan2loantermsController.clear();
                              isYearloan1 = true;
                              isMonthloan1 = false;
                              isYearloan2 = true;
                              isMonthloan2 = false;
                              // _emiResult = "";
                              // principalrate = '';
                              // interestrate = '';
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
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            _loan1emiResult.isEmpty || _loan2emiResult.isEmpty
                ? Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      BigNativeAds(),
                    ],
                  )
                : const SizedBox(),
            _loan1emiResult.isEmpty || _loan2emiResult.isEmpty
                ? const SizedBox()
                : Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 2,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 15.0, bottom: 8.0),
                      child: Column(children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "EMI (Monthly Installment)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Appcolor.grey100,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ ${formatter.format(double.parse(_loan1emiResult).round())}",
                                  style: const TextStyle(
                                      color: Appcolor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Container(
                                  height: 25,
                                  width: 1.5,
                                  color: Appcolor.grey,
                                ),
                                Text(
                                  "₹ ${formatter.format(double.parse(_loan2emiResult).round())}",
                                  style: const TextStyle(
                                      color: Appcolor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "loan Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Appcolor.grey100,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹  ${_loan1loanamountController.text}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Container(
                                  height: 25,
                                  width: 1.5,
                                  color: Appcolor.grey,
                                ),
                                Text(
                                  "₹  ${_loan2loanamountController.text}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Total Interest",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Appcolor.grey100,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ ${formatter.format(loan1totalpayment.round() - int.parse(_loan1loanamountController.text.replaceAll(",", '')))}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Container(
                                  height: 25,
                                  width: 1.5,
                                  color: Appcolor.grey,
                                ),
                                Text(
                                  "₹ ${formatter.format(loan2totalpayment.round() - int.parse(_loan2loanamountController.text.replaceAll(",", '')))}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Total Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Appcolor.grey100,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ ${formatter.format(loan1totalpayment.round())}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Container(
                                  height: 25,
                                  width: 1.5,
                                  color: Appcolor.grey,
                                ),
                                Text(
                                  "₹ ${formatter.format(loan2totalpayment.round())}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Appcolor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "No. of Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Appcolor.grey100,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isYearloan1
                                      ? "${int.parse(_loan1loantermsController.text) * 12}"
                                      : "${int.parse(_loan1loantermsController.text)}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Container(
                                  height: 25,
                                  width: 1.5,
                                  color: Appcolor.grey,
                                ),
                                Text(
                                  isYearloan2
                                      ? "${int.parse(_loan2loantermsController.text) * 12}"
                                      : "${int.parse(_loan2loantermsController.text)}",
                                  style: const TextStyle(
                                      color: Appcolor.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              clickCountFunction();
                              setState(() {
                                isloading = true;
                              });
                              await screenshotController
                                  .capture(
                                      pixelRatio: MediaQuery.of(context)
                                          .devicePixelRatio,
                                      delay: const Duration(milliseconds: 10))
                                  .then((image) async {
                                if (image != null) {
                                  final directory =
                                      await getApplicationSupportDirectory();
                                  final imagePath =
                                      await File('${directory.path}/image.png')
                                          .create();
                                  await imagePath.writeAsBytes(image);
                                  await Share.shareXFiles(
                                      [XFile(imagePath.path)]);
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: Appcolor.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: isloading
                                  ? Container(
                                      margin: const EdgeInsets.all(5),
                                      height: 20,
                                      width: 20,
                                      child: const CircularProgressIndicator(
                                        color: Appcolor.white,
                                      ),
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.share,
                                          color: Appcolor.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Share",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Appcolor.white,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ),
          ],
        )),
      ),
    );
  }

  void _handleCalculation() {
    if (_loan1loanamountController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 1 Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loan1interestrateController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 1 Interest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loan1loantermsController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 1 Loan Terms.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (isYearloan1 == false && isMonthloan1 == false) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Select Loan 1 Year Or Month.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loan2loanamountController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 2 Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loan2interestrateController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 2 Interest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_loan2loantermsController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Enter Loan 2 Loan Terms.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (isYearloan2 == false && isMonthloan2 == false) {
      ScaffoldMessenger.of(context).clearSnackBars();
      showSnackBar(
        context: context,
        message: "Please Select Loan 2 Year Or Month.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double A = 0.0;
      int P = int.parse(
          _loan1loanamountController.text.replaceAll(",", "").toString());
      double x = double.parse(_loan1interestrateController.text);
      double r = x / 12 / 100;
      int n = isYearloan1
          ? int.parse(_loan1loantermsController.text) * 12
          : int.parse(_loan1loantermsController.text);

      A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

      _loan1emiResult = A.toStringAsFixed(2);
      double total = 0;
      if (isYearloan1)
        for (int i = 0; i < int.parse(_loan1loantermsController.text); i++) {
          for (int j = 0; j < 12; j++) {
            total = total + double.parse(_loan1emiResult);
          }
        }
      else if (isMonthloan1)
        for (int i = 0; i < int.parse(_loan1loantermsController.text); i++) {
          total = total + double.parse(_loan1emiResult);
        }
      loan1totalpayment = isYearloan1
          ? double.parse(_loan1emiResult) *
              int.parse(_loan1loantermsController.text) *
              12
          : double.parse(_loan1emiResult) *
              int.parse(_loan1loantermsController.text);

      double A1 = 0.0;
      int P1 = int.parse(
          _loan2loanamountController.text.replaceAll(",", "").toString());
      double x1 = double.parse(_loan2interestrateController.text);
      double r1 = x1 / 12 / 100;
      int n1 = isYearloan1
          ? int.parse(_loan2loantermsController.text) * 12
          : int.parse(_loan2loantermsController.text);

      A1 = (P1 * r1 * pow((1 + r1), n1) / (pow((1 + r1), n1) - 1));

      _loan2emiResult = A1.toStringAsFixed(2);
      double total1 = 0;
      if (isYearloan2)
        for (int i = 0; i < int.parse(_loan2loantermsController.text); i++) {
          for (int j = 0; j < 12; j++) {
            total1 = total1 + double.parse(_loan2emiResult);
          }
        }
      else if (isMonthloan2)
        for (int i = 0; i < int.parse(_loan2loantermsController.text); i++) {
          total1 = total1 + double.parse(_loan2emiResult);
        }
      loan2totalpayment = isYearloan2
          ? double.parse(_loan2emiResult) *
              int.parse(_loan2loantermsController.text) *
              12
          : double.parse(_loan2emiResult) *
              int.parse(_loan2loantermsController.text);
      setState(() {});
    }
  }
}
