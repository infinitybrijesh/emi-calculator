// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class HouseRentScreen extends StatefulWidget {
  const HouseRentScreen({super.key});

  @override
  State<HouseRentScreen> createState() => _HouseRentScreenState();
}

class _HouseRentScreenState extends State<HouseRentScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _basicSalaryController = TextEditingController();
  final TextEditingController _totalRentPaidController =
      TextEditingController();
  final TextEditingController _dearnessAllowanceController =
      TextEditingController();
  final TextEditingController _hraReceivedController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String HRAExempted = '';
  bool isYes = true;
  bool isNo = false;
  var formatter = NumberFormat('#,##,###');
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Appcolor.white,
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
          'House Rent Deduction',
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
                              controller: _basicSalaryController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _basicSalaryController.text = retult;
                                _basicSalaryController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _basicSalaryController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Basic Salary",
                                prefix: const Text("Rs."),
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
                              controller: _hraReceivedController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _hraReceivedController.text = retult;
                                _hraReceivedController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _hraReceivedController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "HRA Received",
                                prefix: const Text("Rs."),
                                suffix: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child:
                                      Icon(Icons.info, color: Appcolor.black),
                                ),
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
                              controller: _totalRentPaidController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _totalRentPaidController.text = retult;
                                _totalRentPaidController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _totalRentPaidController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Total Rent Paid",
                                prefix: const Text("Rs."),
                                suffix: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child:
                                      Icon(Icons.info, color: Appcolor.black),
                                ),
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
                              controller: _dearnessAllowanceController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _dearnessAllowanceController.text = retult;
                                _dearnessAllowanceController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _dearnessAllowanceController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Dearness Allowance (Optional)",
                                suffix: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child:
                                      Icon(Icons.info, color: Appcolor.black),
                                ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: const Text(
                                      "Do you live in Delhi, Mumbai, Kolkata or Chennai?")),
                              Row(
                                children: [
                                  ChoiceChip(
                                    label: Text(
                                      " Yes ",
                                      style: TextStyle(
                                          color: isYes
                                              ? Appcolor.white
                                              : Appcolor.black),
                                    ),
                                    selectedColor: Appcolor.primaryColor,
                                    selected: isYes,
                                    onSelected: (value) {
                                      setState(() {
                                        isNo = false;
                                        isYes = !isYes;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  ChoiceChip(
                                    label: Text(
                                      " No ",
                                      style: TextStyle(
                                          color: isNo
                                              ? Appcolor.white
                                              : Appcolor.black),
                                    ),
                                    selectedColor: Appcolor.primaryColor,
                                    selected: isNo,
                                    onSelected: (value) {
                                      setState(() {
                                        isYes = false;
                                        isNo = !isNo;
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
                                    _hraReceivedController.clear();
                                    _basicSalaryController.clear();
                                    _totalRentPaidController.clear();
                                    _dearnessAllowanceController.clear();
                                    isYes = true;
                                    isNo = false;
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
                  HRAExempted != ''
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "HRA Exempted",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: Appcolor.primaryColor),
                                      ),
                                      Text(
                                        "₹ $HRAExempted",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: Appcolor.primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
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
                                                Text("HRA Taxable"),
                                                Divider(),
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
                                              const Text("₹..."),
                                              const Divider(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              Appcolor.primaryColor,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.25,
                                          child: const Text(
                                              "If you don't receive HRA, you can still claim upto ₹... deduction U/S 80GG.",
                                              style: TextStyle(fontSize: 13)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10)
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

  _handleCalculation() {
    double actualHRAReceived = 20000;
    double rentPaid = 12000;
    double salary = 50000;

    double hraExempted = 0;

    double leastAmount = actualHRAReceived;
    if (rentPaid > salary * 0.1) {
      leastAmount = salary * 0.1;
    } else if (actualHRAReceived > salary * 0.5) {
      leastAmount = salary * 0.5;
    } else if (actualHRAReceived > salary * 0.4) {
      leastAmount = salary * 0.4;
    }

    hraExempted = leastAmount * 12;
    HRAExempted = hraExempted.toStringAsFixed(2);
    log("HRA exxempted = $HRAExempted");
  }
}
