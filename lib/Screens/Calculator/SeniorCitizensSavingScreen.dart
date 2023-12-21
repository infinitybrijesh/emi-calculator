// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/ViewSeniorDetaiPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class SeniorCitizensSavingScreen extends StatefulWidget {
  const SeniorCitizensSavingScreen({super.key});

  @override
  State<SeniorCitizensSavingScreen> createState() =>
      _SeniorCitizensSavingScreenState();
}

class _SeniorCitizensSavingScreenState
    extends State<SeniorCitizensSavingScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _iscalculate = false;
  int total = 0;
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
          'Senior Citizens Saving Scheme (SCSS)',
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
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          String retult = formatter.format(int.parse(value));
                          _amountController.text = retult;
                          _amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _amountController.text.length));
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
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: _rateController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                        Text("Term"),
                        Text("5 Years"),
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
                              _amountController.clear();
                              _rateController.clear();
                              _iscalculate = false;
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
                            setState(() {
                              _iscalculate = true;
                            });
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
          !_iscalculate && _amountController.text.isEmpty
              ? Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    BigNativeAds(),
                  ],
                )
              : const SizedBox(),
          _iscalculate && _amountController.text.isNotEmpty
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
                        margin: const EdgeInsets.only(top: 0, bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quaterly Ammount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.primaryColor,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "₹ ${formatter.format(total)}",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total interest"),
                          Text('₹ ${formatter.format(total * 20)}'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Deposit"),
                          Text(
                              '₹ ${formatter.format(int.parse(_amountController.text.replaceAll(',', '')) + total * 20)}'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(
                                "You will receive interest ₹ ${formatter.format(total)} every quarter."),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "⦿",
                            style: TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(
                                "At the end of the term, you will get your deposite amount Rs.${_amountController.text} back."),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewSeniorDetaiPage(
                                      amount: int.parse(_amountController.text
                                          .replaceAll(',', '')),
                                      interest: total,
                                    ),
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
                    ]),
                  ),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }

  _handleCalculation() {
    int price = int.parse(_amountController.text.replaceAll(",", ''));
    double rate = double.parse(_rateController.text);
    int subtotal = (price * rate) ~/ 20;
    total = subtotal ~/ 20;
    setState(() {});
  }
}
