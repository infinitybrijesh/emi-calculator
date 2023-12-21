// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class NationalPensionSchemeScreen extends StatefulWidget {
  const NationalPensionSchemeScreen({super.key});

  @override
  State<NationalPensionSchemeScreen> createState() =>
      _NationalPensionSchemeScreenState();
}

class _NationalPensionSchemeScreenState
    extends State<NationalPensionSchemeScreen> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _currentNPSBalanceController =
      TextEditingController();
  final TextEditingController _yourContributionController =
      TextEditingController();
  final TextEditingController _employerContributionController =
      TextEditingController();
  final TextEditingController _increaseContributionController =
      TextEditingController();
  final TextEditingController _expectedReturnController =
      TextEditingController();
  final TextEditingController _amountAtRetirementController =
      TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _withdrawlPercentageController =
      TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  String dropdownvalue4 = '60 Year(Retirement)';
  String dropdownvalue3 = 'Rupee (Rs.)';
  String dropdownvalue2 = 'Monthly';
  String dropdownvalue1 = 'Monthly';
  var items4 = [
    '60 Year(Retirement)',
    '61 Year',
    '62 Year',
    '63 Year',
    '64 Year',
    '65 Year',
    '66 Year',
    '67 Year',
    '68 Year',
    '69 Year',
    '70 Year(Exit)',
  ];
  var items3 = [
    'Rupee (Rs.)',
    'Percent (%)',
  ];
  var items1 = [
    'Monthly',
    'Bi-Monthly',
    'Quarterly',
    'Thrice Yearly',
    'Half Yearly',
    'Yearly',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold( backgroundColor: Appcolor.white,
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
            'National Pension Scheme',
            style: TextStyle(
                color: Appcolor.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 0.5),
          ),
          bottom: const TabBar(
            labelColor: Appcolor.primaryColor,
            indicatorColor: Appcolor.primaryColor,
            labelStyle: TextStyle(fontSize: 13),
            tabs: [Tab(text: "Home"), Tab(text: "Pension")],
          ),
        ),
        body: TabBarView(
          children: [
            // Home

            SingleChildScrollView(
              child: Container(
                color: Appcolor.white,
                child: Form(
                  key: _formkey1,
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
                                  controller: _ageController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {},
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Your Age (Years)",
                                    hintText:
                                        "Enter value within 18 to 70 year",
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
                                  controller: _currentNPSBalanceController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _currentNPSBalanceController.text = retult;
                                    _currentNPSBalanceController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _currentNPSBalanceController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Current NPS Balance (Optional)",
                                    hintText: "Optional",
                                    prefix: const Text("RS."),
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
                                  controller: _yourContributionController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _yourContributionController.text = retult;
                                    _yourContributionController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _yourContributionController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Your Contribution (₹)",
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue1,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 14)),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue1 = newValue!;
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
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _employerContributionController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _employerContributionController.text =
                                        retult;
                                    _employerContributionController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _employerContributionController
                                                    .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText:
                                        "Employer Contribution (Optional)",
                                    hintText: "Optional",
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue2,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 14)),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue2 = newValue!;
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
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _increaseContributionController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _increaseContributionController.text =
                                        retult;
                                    _increaseContributionController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _increaseContributionController
                                                    .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText:
                                        "Increase Contribution (Optional)",
                                    hintText: "Optional",
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue3,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items3.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 14)),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue3 = newValue!;
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
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _expectedReturnController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _expectedReturnController.text = retult;
                                    _expectedReturnController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _expectedReturnController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Expected Return (%)",
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Contribute Till",
                                        style: TextStyle(color: Appcolor.black),
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: dropdownvalue4,
                                            icon: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20),
                                            ),
                                            items: items4.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(items,
                                                      style: const TextStyle(
                                                          fontSize: 14)),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue4 = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Appcolor.red400),
                                    onPressed: () {
                                      setState(() {
                                        FocusScope.of(context).unfocus();
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

                      Column(
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
                                children: const [
                                  Text(
                                    "Amount at retirement",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Appcolor.primaryColor),
                                  ),
                                  Text(
                                    "₹...",
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
                                              Text("Your Contributions"),
                                              Divider(),
                                              Text("Employer Contributions"),
                                              Divider(),
                                              Text("Total Contributions"),
                                              Divider(),
                                              Text("NPS Balance"),
                                              Divider(),
                                              Text("Total Returns"),
                                            ],
                                          )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Text("₹..."),
                                            Divider(),
                                            Text("₹..."),
                                            Divider(),
                                            Text("₹..."),
                                            Divider(),
                                            Text("₹..."),
                                            Divider(),
                                            Text("₹..."),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "At Retirement or at Exit, you can withdraw a maximum of 60% of the accumulated amount.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "The Remaining amount should be invested to purchase a 'Pension Fund' that provides monthly pension during your retirement life.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "Go to 'Pension Tab' to calculate further.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
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
                                          const SizedBox(
                                            width: 8,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Pension

            SingleChildScrollView(
              child: Container(
                color: Appcolor.white,
                child: Form(
                  key: _formkey2,
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
                                  controller: _amountAtRetirementController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _amountAtRetirementController.text = retult;
                                    _amountAtRetirementController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _amountAtRetirementController
                                                    .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Amount At Retirement (₹)",
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
                                  controller: _withdrawlPercentageController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Withdrawl Percentage (%)",
                                    suffix: const Text("%   "),
                                    hintText: "0% - 60%",
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
                                  controller: _interestRateController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Interest Rate (%)",
                                    hintText: "6% Currently",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Appcolor.red400),
                                    onPressed: () {
                                      setState(() {
                                        FocusScope.of(context).unfocus();
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

                      Column(
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
                                children: const [
                                  Text(
                                    "Withdrawl Amount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Appcolor.primaryColor),
                                  ),
                                  Text(
                                    "₹...",
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
                                              Text("Monthly Pension"),
                                              Divider(),
                                              Text("Amount to Nominee"),
                                            ],
                                          )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Text("₹..."),
                                            Divider(),
                                            Text(("₹...")),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "At retirement / exit, you opt to withdraw ₹...",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "You have opt to invest remaining ₹... to purchase the pension funds.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "After retirement / exit, you will get monthly pension ₹... throughout your life.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Appcolor.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.25,
                                        child: const Text(
                                            "At the end of your life, the pension deposit amount ₹... will be given back to your nominees.",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
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
                                          const SizedBox(
                                            width: 8,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
