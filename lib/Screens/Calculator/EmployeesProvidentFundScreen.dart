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

class EmployeesProvidentFundScreen extends StatefulWidget {
  const EmployeesProvidentFundScreen({super.key});

  @override
  State<EmployeesProvidentFundScreen> createState() =>
      _EmployeesProvidentFundScreenState();
}

class _EmployeesProvidentFundScreenState
    extends State<EmployeesProvidentFundScreen> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  final TextEditingController _ageController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _currentEPFBalanceController =
      TextEditingController();
  final TextEditingController _currentEPSBalanceController =
      TextEditingController();
  final TextEditingController _monthlyBasicPayDAController =
      TextEditingController();
  final TextEditingController _increaseBasicPayDAController =
      TextEditingController();
  final TextEditingController _annualInterestRateController =
      TextEditingController();
  final TextEditingController _retiermentAgeController =
      TextEditingController();
  final TextEditingController _pensionableSalaryController =
      TextEditingController();
  final TextEditingController _pensionableServiceController =
      TextEditingController();
  String dropdownvalue2 = 'Rupee (Rs.)';
  String dropdownvalue1 = 'Yes. There is a limit on Contribution.';
  var items2 = [
    'Rupee (Rs.)',
    'Percent (%)',
  ];
  var items1 = [
    'Yes. There is a limit on Contribution.',
    'No limit on Contributions'
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
            'Employees Provident Fund',
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
                                    labelStyle: const TextStyle(fontSize: 13),
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
                                  controller: _currentEPFBalanceController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _currentEPFBalanceController.text = retult;
                                    _currentEPFBalanceController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _currentEPFBalanceController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Current EPF Balance (Optional)",
                                    labelStyle: const TextStyle(fontSize: 13),
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
                                  controller: _currentEPSBalanceController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _currentEPSBalanceController.text = retult;
                                    _currentEPSBalanceController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _currentEPSBalanceController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Current EPS Balance (Optional)",
                                    labelStyle: const TextStyle(fontSize: 13),
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
                                  controller: _monthlyBasicPayDAController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _monthlyBasicPayDAController.text = retult;
                                    _monthlyBasicPayDAController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _monthlyBasicPayDAController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText:
                                        "Monthly Basic Pay + DA(Dearness Allowance)",
                                    labelStyle: const TextStyle(fontSize: 13),
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
                                  controller: _increaseBasicPayDAController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _increaseBasicPayDAController.text = retult;
                                    _increaseBasicPayDAController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _increaseBasicPayDAController
                                                    .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText:
                                        "Increase Basic Pay + DA Annualy (Optional)",
                                        labelStyle: const TextStyle(fontSize: 13),
                                    hintText: "Optional",
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue2,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items2.map((String items) {
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
                                  controller: _annualInterestRateController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _annualInterestRateController.text = retult;
                                    _annualInterestRateController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _annualInterestRateController
                                                    .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Annual Interest Rate (%)",
                                    labelStyle: const TextStyle(fontSize: 13),
                                    hintText: "8.1% Currently",
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
                                height: 45,
                                child: TextFormField(
                                  controller: _retiermentAgeController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _retiermentAgeController.text = retult;
                                    _retiermentAgeController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _retiermentAgeController
                                                .text.length));
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Retirement Age",
                                    labelStyle: const TextStyle(fontSize: 13),
                                    hintText: "Minimum 55 Year",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                  "Does Your Employer limit contributions to monthly Basic Pay + DA of Rs.15,000"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1,
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButtonHideUnderline(
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
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                          elevation: 2,margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Maturity Amount",
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
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Your Contributions"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Employer Contributions (EPF)"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Employer Contributions (EPS)"),
                                        Text("₹..."),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Total Interest"),
                                        Text("₹..."),
                                      ],
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "At retirement, you can withdraw the entire maturity amount.",
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "You will NOT receive the accumulated EPS contributions amount as it will be used by the EPFO office to provide monthly pension after retirement.",
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
                              const Text("Pensionable Salary (Average of last 12 Month's Basic Pay + DA Before Retirement) (₹)"),
                              const SizedBox(height: 10,),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _pensionableSalaryController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _pensionableSalaryController.text = retult;
                                    _pensionableSalaryController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset:
                                                _pensionableSalaryController
                                                    .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
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
                              const Text("Pensionable Service (Total Number of years of Service)"),
                              const SizedBox(height: 10,),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _pensionableServiceController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
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
                          elevation: 2,margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Maturity Amount",
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
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Column(
                              children: [
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "You will receive monthly pension till the end of your life.",
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "After that, your spouse and 2 children below the age of 25 years will receive the monthly pension.",
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "The monthly pension calculated above is for the employees who joined service after 15-Nov_1995. This is a part of EPS scheme.",
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "For those employees who joined before 15-Nov-1995, pension is provided by FPS (Family Pension Scheme) and it is not covered here.",
                                          style: TextStyle(fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,)
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
