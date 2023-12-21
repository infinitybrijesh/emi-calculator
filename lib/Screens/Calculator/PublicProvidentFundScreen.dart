// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class PublicProvidentFundScreen extends StatefulWidget {
  const PublicProvidentFundScreen({super.key});

  @override
  State<PublicProvidentFundScreen> createState() =>
      _PublicProvidentFundScreenState();
}

class _PublicProvidentFundScreenState extends State<PublicProvidentFundScreen> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey3 = GlobalKey<FormState>();
  final TextEditingController _depositamountControllerNA =
      TextEditingController();
  final TextEditingController _rateControllerNA = TextEditingController();
  final TextEditingController _depositamountControllerEA =
      TextEditingController();
  final TextEditingController _rateControllerEA = TextEditingController();
  final TextEditingController _accountBalanceControllerEA =
      TextEditingController();
  final TextEditingController _openingBalanceControllerE =
      TextEditingController();
  final TextEditingController _depositamountControllerE =
      TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _rateControllerE = TextEditingController();
  var formatter = NumberFormat('#,##,###');
  String dropdownvalue1 = '1 Financial year';
  String dropdownvalue2 = '5 Years';
  String dropdownvalue3 = 'With Deposits';
  String dropdownvalue4 = 'Monthly';
  String dropdownvalue5 = 'Monthly';
  String dropdownvalue6 = 'Monthly';
  double maturityAmount = 0.0;
  double totalDeposit = 0.0;
  double totalInterest = 0.0;
  var items1 = [
    '1 Financial year',
    '2 Financial year',
    '3 Financial year',
    '4 Financial year',
    '5 Financial year',
    '6 Financial year',
    '7 Financial year',
    '8 Financial year',
    '9 Financial year',
    '10 Financial year',
    '11 Financial year',
    '12 Financial year',
    '13 Financial year',
    '14 Financial year',
  ];
  var items2 = [
    '5 Years',
    '10 Years',
    '15 Years',
    '20 Years',
    '25 Years',
    '30 Years',
    '35 Years',
    '40 Years',
    '45 Years',
    '50 Years'
  ];
  var items3 = ['With Deposits', 'Without Deposits'];
  var items4 = [
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
      length: 3,
      child: Scaffold(
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
            'Public Provident Fund',
            style: TextStyle(
                color: Appcolor.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 0.5),
          ),
          bottom: TabBar(
            onTap: (value) {
              clickCountFunction();
              setState(() {
                _rateControllerNA.clear();
                _rateControllerE.clear();
                _depositamountControllerE.clear();
                _openingBalanceControllerE.clear();
                _accountBalanceControllerEA.clear();
                _rateControllerEA.clear();
                _depositamountControllerEA.clear();
                dropdownvalue1 = '1 Financial year';
                dropdownvalue2 = '5 Years';
                dropdownvalue3 = 'With Deposits';
                dropdownvalue4 = 'Monthly';
                dropdownvalue5 = 'Monthly';
                dropdownvalue6 = 'Monthly';
                maturityAmount = 0.0;
                totalDeposit = 0.0;
                totalInterest = 0.0;
              });
            },
            labelColor: Appcolor.primaryColor,
            indicatorColor: Appcolor.primaryColor,
            labelStyle: TextStyle(fontSize: 13),
            tabs: const [
              Tab(text: "New Account"),
              Tab(text: "Existing Account"),
              Tab(text: "Extension")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //New Account

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
                                  controller: _depositamountControllerNA,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _depositamountControllerNA.text = retult;
                                    _depositamountControllerNA.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _depositamountControllerNA
                                                .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Deposit Amount (₹)",
                                    prefix: const Text("Rs. "),
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue6,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items4.map((String items) {
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
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: _rateControllerNA,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Rate (%)",
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
                                    children: const [
                                      Text(
                                        "Maturity Period",
                                        style: TextStyle(color: Appcolor.black),
                                      ),
                                      Text(
                                        "15 Full Financial Years",
                                        style: TextStyle(color: Appcolor.black),
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
                                        _rateControllerNA.clear();
                                        _rateControllerE.clear();
                                        _depositamountControllerE.clear();
                                        _openingBalanceControllerE.clear();
                                        _accountBalanceControllerEA.clear();
                                        _rateControllerEA.clear();
                                        _depositamountControllerEA.clear();
                                        dropdownvalue1 = '1 Financial year';
                                        dropdownvalue2 = '5 Years';
                                        dropdownvalue3 = 'With Deposits';
                                        dropdownvalue4 = 'Monthly';
                                        dropdownvalue5 = 'Monthly';
                                        dropdownvalue6 = 'Monthly';
                                        maturityAmount = 0.0;
                                        totalDeposit = 0.0;
                                        totalInterest = 0.0;
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

                                      _handleCalculationnew();
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
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
                                    ],
                                  ),
                                ),
                                // Card(
                                //   elevation: 2,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(15)),
                                //   margin: const EdgeInsets.symmetric(
                                //       vertical: 15, horizontal: 10),
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 15, left: 15, right: 15),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             SizedBox(
                                //                 width: MediaQuery.of(context)
                                //                         .size
                                //                         .width *
                                //                     0.42,
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: const [
                                //                     Text("Total Deposit"),
                                //                     Divider(),
                                //                     Text("Total Interest"),
                                //                   ],
                                //                 )),
                                //             SizedBox(
                                //               width:
                                //                   MediaQuery.of(context).size.width *
                                //                       0.42,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.end,
                                //                 children: const [
                                //                   Text("₹..."),
                                //                   Divider(),
                                //                   Text(("₹...")),
                                //                 ],
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         const Divider(),
                                //         // Card(
                                //         //   color: Appcolor.grey200,
                                //         //   shape: RoundedRectangleBorder(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //   ),
                                //         //   child: InkWell(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //     onTap: () async {
                                //         //       await screenshotController
                                //         //           .capture(
                                //         //               pixelRatio:
                                //         //                   MediaQuery.of(context)
                                //         //                       .devicePixelRatio,
                                //         //               delay: const Duration(
                                //         //                   milliseconds: 10))
                                //         //           .then((image) async {
                                //         //         if (image != null) {
                                //         //           final directory =
                                //         //               await getApplicationSupportDirectory();
                                //         //           final imagePath = await File(
                                //         //                   '${directory.path}/image.png')
                                //         //               .create();
                                //         //           await imagePath.writeAsBytes(image);
                                //         //           await Share.shareFiles(
                                //         //               [imagePath.path]);
                                //         //         }
                                //         //       });
                                //         //     },
                                //         //     child: Padding(
                                //         //       padding: const EdgeInsets.symmetric(
                                //         //           horizontal: 8.0, vertical: 5),
                                //         //       child: Row(children: [
                                //         //         SvgPicture.asset(
                                //         //           'assets/svg/jpg.svg',
                                //         //           height: 30,
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //         const Text(
                                //         //           "JPG",
                                //         //           style: TextStyle(
                                //         //             fontWeight: FontWeight.bold,
                                //         //             color: Appcolor.primaryColor,
                                //         //             letterSpacing: 1,
                                //         //           ),
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //       ]),
                                //         //     ),
                                //         //   ),
                                //         // ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),

            //Existing Account

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
                                  controller: _accountBalanceControllerEA,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _accountBalanceControllerEA.text = retult;
                                    _accountBalanceControllerEA.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _accountBalanceControllerEA
                                                .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Account balance (₹)",
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
                                  controller: _depositamountControllerEA,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _depositamountControllerEA.text = retult;
                                    _depositamountControllerEA.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _depositamountControllerEA
                                                .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, bottom: 20),
                                    labelText: "Deposit Amount (₹)",
                                    suffix: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue5,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 20),
                                        ),
                                        items: items4.map((String items) {
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
                                            dropdownvalue5 = newValue!;
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
                                  controller: _rateControllerEA,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Rate (%)",
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
                                      Text(
                                        "Term Completed",
                                        style: TextStyle(color: Appcolor.black),
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: dropdownvalue1,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 5),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20),
                                            ),
                                            items: items1.map((String items) {
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
                                                dropdownvalue1 = newValue!;
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
                                        _rateControllerNA.clear();
                                        _rateControllerE.clear();
                                        _depositamountControllerE.clear();
                                        _openingBalanceControllerE.clear();
                                        _accountBalanceControllerEA.clear();
                                        _rateControllerEA.clear();
                                        _depositamountControllerEA.clear();
                                        dropdownvalue1 = '1 Financial year';
                                        dropdownvalue2 = '5 Years';
                                        dropdownvalue3 = 'With Deposits';
                                        dropdownvalue4 = 'Monthly';
                                        dropdownvalue5 = 'Monthly';
                                        dropdownvalue6 = 'Monthly';
                                        maturityAmount = 0.0;
                                        totalDeposit = 0.0;
                                        totalInterest = 0.0;
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
                                      _handleCalculationExistingAccount();
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
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
                                    ],
                                  ),
                                ),
                                // Card(
                                //   elevation: 2,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(15)),
                                //   margin: const EdgeInsets.symmetric(
                                //       vertical: 15, horizontal: 10),
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 15, left: 15, right: 15),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             SizedBox(
                                //                 width: MediaQuery.of(context)
                                //                         .size
                                //                         .width *
                                //                     0.42,
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: const [
                                //                     Text("Total Deposit"),
                                //                     Divider(),
                                //                     Text("Total Interest"),
                                //                   ],
                                //                 )),
                                //             SizedBox(
                                //               width:
                                //                   MediaQuery.of(context).size.width *
                                //                       0.42,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.end,
                                //                 children: const [
                                //                   Text("₹..."),
                                //                   Divider(),
                                //                   Text(("₹...")),
                                //                 ],
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         const Divider(),
                                //         // Card(
                                //         //   color: Appcolor.grey200,
                                //         //   shape: RoundedRectangleBorder(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //   ),
                                //         //   child: InkWell(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //     onTap: () async {
                                //         //       await screenshotController
                                //         //           .capture(
                                //         //               pixelRatio:
                                //         //                   MediaQuery.of(context)
                                //         //                       .devicePixelRatio,
                                //         //               delay: const Duration(
                                //         //                   milliseconds: 10))
                                //         //           .then((image) async {
                                //         //         if (image != null) {
                                //         //           final directory =
                                //         //               await getApplicationSupportDirectory();
                                //         //           final imagePath = await File(
                                //         //                   '${directory.path}/image.png')
                                //         //               .create();
                                //         //           await imagePath.writeAsBytes(image);
                                //         //           await Share.shareFiles(
                                //         //               [imagePath.path]);
                                //         //         }
                                //         //       });
                                //         //     },
                                //         //     child: Padding(
                                //         //       padding: const EdgeInsets.symmetric(
                                //         //           horizontal: 8.0, vertical: 5),
                                //         //       child: Row(children: [
                                //         //         SvgPicture.asset(
                                //         //           'assets/svg/jpg.svg',
                                //         //           height: 30,
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //         const Text(
                                //         //           "JPG",
                                //         //           style: TextStyle(
                                //         //             fontWeight: FontWeight.bold,
                                //         //             color: Appcolor.primaryColor,
                                //         //             letterSpacing: 1,
                                //         //           ),
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //       ]),
                                //         //     ),
                                //         //   ),
                                //         // ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),

                      //Condition to be applied here for results.

                      // Column(
                      //   children: [
                      //     Card(
                      //       elevation: 2,
                      //       margin: const EdgeInsets.symmetric(
                      //           vertical: 15, horizontal: 10),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "Maturity Amount",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1,
                      //                   color: Appcolor.primaryColor),
                      //             ),
                      //             Text(
                      //               "₹ ${formatter.format(maturityAmount)}",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1,
                      //                   color: Appcolor.primaryColor),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),

                      //     // Card(
                      //     //   elevation: 2,
                      //     //   shape: RoundedRectangleBorder(
                      //     //       borderRadius: BorderRadius.circular(15)),
                      //     //   margin: const EdgeInsets.symmetric(
                      //     //       vertical: 15, horizontal: 10),
                      //     //   child: Padding(
                      //     //     padding: const EdgeInsets.only(
                      //     //         top: 15, left: 15, right: 15),
                      //     //     child: Column(
                      //     //       children: [
                      //     //         Row(
                      //     //           mainAxisAlignment:
                      //     //               MainAxisAlignment.spaceBetween,
                      //     //           children: [
                      //     //             SizedBox(
                      //     //                 width: MediaQuery.of(context)
                      //     //                         .size
                      //     //                         .width *
                      //     //                     0.42,
                      //     //                 child: Column(
                      //     //                   crossAxisAlignment:
                      //     //                       CrossAxisAlignment.start,
                      //     //                   children: const [
                      //     //                     Text("Total Deposit"),
                      //     //                     Divider(),
                      //     //                     Text("Total Interest"),
                      //     //                   ],
                      //     //                 )),
                      //     //             SizedBox(
                      //     //               width:
                      //     //                   MediaQuery.of(context).size.width *
                      //     //                       0.42,
                      //     //               child: Column(
                      //     //                 crossAxisAlignment:
                      //     //                     CrossAxisAlignment.end,
                      //     //                 children: const [
                      //     //                   Text("₹..."),
                      //     //                   Divider(),
                      //     //                   Text(("₹...")),
                      //     //                 ],
                      //     //               ),
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //         const Divider(),
                      //     //         Card(
                      //     //           color: Appcolor.grey200,
                      //     //           shape: RoundedRectangleBorder(
                      //     //             borderRadius: BorderRadius.circular(8),
                      //     //           ),
                      //     //           child: InkWell(
                      //     //             borderRadius: BorderRadius.circular(8),
                      //     //             onTap: () async {
                      //     //               await screenshotController
                      //     //                   .capture(
                      //     //                       pixelRatio:
                      //     //                           MediaQuery.of(context)
                      //     //                               .devicePixelRatio,
                      //     //                       delay: const Duration(
                      //     //                           milliseconds: 10))
                      //     //                   .then((image) async {
                      //     //                 if (image != null) {
                      //     //                   final directory =
                      //     //                       await getApplicationSupportDirectory();
                      //     //                   final imagePath = await File(
                      //     //                           '${directory.path}/image.png')
                      //     //                       .create();
                      //     //                   await imagePath.writeAsBytes(image);
                      //     //                   await Share.shareFiles(
                      //     //                       [imagePath.path]);
                      //     //                 }
                      //     //               });
                      //     //             },
                      //     //             child: Padding(
                      //     //               padding: const EdgeInsets.symmetric(
                      //     //                   horizontal: 8.0, vertical: 5),
                      //     //               child: Row(children: [
                      //     //                 SvgPicture.asset(
                      //     //                   'assets/svg/jpg.svg',
                      //     //                   height: 30,
                      //     //                 ),
                      //     //                 const SizedBox(
                      //     //                   width: 8,
                      //     //                 ),
                      //     //                 const Text(
                      //     //                   "JPG",
                      //     //                   style: TextStyle(
                      //     //                     fontWeight: FontWeight.bold,
                      //     //                     color: Appcolor.primaryColor,
                      //     //                     letterSpacing: 1,
                      //     //                   ),
                      //     //                 ),
                      //     //                 const SizedBox(
                      //     //                   width: 8,
                      //     //                 ),
                      //     //               ]),
                      //     //             ),
                      //     //           ),
                      //     //         ),
                      //     //       ],
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            //Extension

            SingleChildScrollView(
              child: Container(
                color: Appcolor.white,
                child: Form(
                  key: _formkey3,
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
                                  controller: _openingBalanceControllerE,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    String retult =
                                        formatter.format(int.parse(value));
                                    _openingBalanceControllerE.text = retult;
                                    _openingBalanceControllerE.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _openingBalanceControllerE
                                                .text.length));
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Opening Balance",
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
                                width: MediaQuery.of(context).size.width / 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Extension Period",
                                        style: TextStyle(color: Appcolor.black),
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: dropdownvalue2,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 5),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20),
                                            ),
                                            items: items2.map((String items) {
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
                                                dropdownvalue2 = newValue!;
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
                                        "Extension Type",
                                        style: TextStyle(color: Appcolor.black),
                                      ),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: dropdownvalue3,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 5),
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20),
                                            ),
                                            items: items3.map((String items) {
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
                                                dropdownvalue3 = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (dropdownvalue3 == "With Deposits")
                                const SizedBox(
                                  height: 15,
                                ),
                              if (dropdownvalue3 == "With Deposits")
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: _depositamountControllerE,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      String retult =
                                          formatter.format(int.parse(value));
                                      _depositamountControllerE.text = retult;
                                      _depositamountControllerE.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset:
                                                      _depositamountControllerE
                                                          .text.length));
                                    },
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, bottom: 20),
                                      labelText: "Deposit Amount (₹)",
                                      prefix: const Text("Rs. "),
                                      suffix: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: dropdownvalue4,
                                          icon: const Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 20),
                                          ),
                                          items: items4.map((String items) {
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
                                              dropdownvalue4 = newValue!;
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
                                  controller: _rateControllerE,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    labelText: "Rate (%)",
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
                                        _rateControllerNA.clear();
                                        _rateControllerE.clear();
                                        _depositamountControllerE.clear();
                                        _openingBalanceControllerE.clear();
                                        _accountBalanceControllerEA.clear();
                                        _rateControllerEA.clear();
                                        _depositamountControllerEA.clear();
                                        dropdownvalue1 = '1 Financial year';
                                        dropdownvalue2 = '5 Years';
                                        dropdownvalue3 = 'With Deposits';
                                        dropdownvalue4 = 'Monthly';
                                        dropdownvalue5 = 'Monthly';
                                        dropdownvalue6 = 'Monthly';
                                        maturityAmount = 0.0;
                                        totalDeposit = 0.0;
                                        totalInterest = 0.0;
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
                                      _handleCalculationExtent();
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

                      // Column(
                      //   children: [
                      //     Card(
                      //       elevation: 2,
                      //       margin: const EdgeInsets.symmetric(
                      //           vertical: 15, horizontal: 10),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: const [
                      //             Text(
                      //               "Maturity Amount",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1,
                      //                   color: Appcolor.primaryColor),
                      //             ),
                      //             Text(
                      //               "₹...",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1,
                      //                   color: Appcolor.primaryColor),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Card(
                      //       elevation: 2,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15)),
                      //       margin: const EdgeInsets.symmetric(
                      //           vertical: 15, horizontal: 10),
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(
                      //             top: 15, left: 15, right: 15),
                      //         child: Column(
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 SizedBox(
                      //                     width: MediaQuery.of(context)
                      //                             .size
                      //                             .width *
                      //                         0.42,
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: const [
                      //                         Text("Total Deposit"),
                      //                         Divider(),
                      //                         Text("Total Interest"),
                      //                       ],
                      //                     )),
                      //                 SizedBox(
                      //                   width:
                      //                       MediaQuery.of(context).size.width *
                      //                           0.42,
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.end,
                      //                     children: const [
                      //                       Text("₹..."),
                      //                       Divider(),
                      //                       Text(("₹...")),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             const Divider(),
                      //             Card(
                      //               color: Appcolor.grey200,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(8),
                      //               ),
                      //               child: InkWell(
                      //                 borderRadius: BorderRadius.circular(8),
                      //                 onTap: () async {
                      //                   await screenshotController
                      //                       .capture(
                      //                           pixelRatio:
                      //                               MediaQuery.of(context)
                      //                                   .devicePixelRatio,
                      //                           delay: const Duration(
                      //                               milliseconds: 10))
                      //                       .then((image) async {
                      //                     if (image != null) {
                      //                       final directory =
                      //                           await getApplicationSupportDirectory();
                      //                       final imagePath = await File(
                      //                               '${directory.path}/image.png')
                      //                           .create();
                      //                       await imagePath.writeAsBytes(image);
                      //                       await Share.shareFiles(
                      //                           [imagePath.path]);
                      //                     }
                      //                   });
                      //                 },
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 8.0, vertical: 5),
                      //                   child: Row(children: [
                      //                     SvgPicture.asset(
                      //                       'assets/svg/jpg.svg',
                      //                       height: 30,
                      //                     ),
                      //                     const SizedBox(
                      //                       width: 8,
                      //                     ),
                      //                     const Text(
                      //                       "JPG",
                      //                       style: TextStyle(
                      //                         fontWeight: FontWeight.bold,
                      //                         color: Appcolor.primaryColor,
                      //                         letterSpacing: 1,
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       width: 8,
                      //                     ),
                      //                   ]),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
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
                                    ],
                                  ),
                                ),
                                // Card(
                                //   elevation: 2,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(15)),
                                //   margin: const EdgeInsets.symmetric(
                                //       vertical: 15, horizontal: 10),
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 15, left: 15, right: 15),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             SizedBox(
                                //                 width: MediaQuery.of(context)
                                //                         .size
                                //                         .width *
                                //                     0.42,
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: const [
                                //                     Text("Total Deposit"),
                                //                     Divider(),
                                //                     Text("Total Interest"),
                                //                   ],
                                //                 )),
                                //             SizedBox(
                                //               width:
                                //                   MediaQuery.of(context).size.width *
                                //                       0.42,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.end,
                                //                 children: const [
                                //                   Text("₹..."),
                                //                   Divider(),
                                //                   Text(("₹...")),
                                //                 ],
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         const Divider(),
                                //         // Card(
                                //         //   color: Appcolor.grey200,
                                //         //   shape: RoundedRectangleBorder(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //   ),
                                //         //   child: InkWell(
                                //         //     borderRadius: BorderRadius.circular(8),
                                //         //     onTap: () async {
                                //         //       await screenshotController
                                //         //           .capture(
                                //         //               pixelRatio:
                                //         //                   MediaQuery.of(context)
                                //         //                       .devicePixelRatio,
                                //         //               delay: const Duration(
                                //         //                   milliseconds: 10))
                                //         //           .then((image) async {
                                //         //         if (image != null) {
                                //         //           final directory =
                                //         //               await getApplicationSupportDirectory();
                                //         //           final imagePath = await File(
                                //         //                   '${directory.path}/image.png')
                                //         //               .create();
                                //         //           await imagePath.writeAsBytes(image);
                                //         //           await Share.shareFiles(
                                //         //               [imagePath.path]);
                                //         //         }
                                //         //       });
                                //         //     },
                                //         //     child: Padding(
                                //         //       padding: const EdgeInsets.symmetric(
                                //         //           horizontal: 8.0, vertical: 5),
                                //         //       child: Row(children: [
                                //         //         SvgPicture.asset(
                                //         //           'assets/svg/jpg.svg',
                                //         //           height: 30,
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //         const Text(
                                //         //           "JPG",
                                //         //           style: TextStyle(
                                //         //             fontWeight: FontWeight.bold,
                                //         //             color: Appcolor.primaryColor,
                                //         //             letterSpacing: 1,
                                //         //           ),
                                //         //         ),
                                //         //         const SizedBox(
                                //         //           width: 8,
                                //         //         ),
                                //         //       ]),
                                //         //     ),
                                //         //   ),
                                //         // ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
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

  double _handleCalculationnew() {
    if (_depositamountControllerNA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_rateControllerNA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double principalAmount =
          double.parse(_depositamountControllerNA.text.replaceAll(',', ''));
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
          (double.parse(_depositamountControllerNA.text.replaceAll(',', ''))) *
              limit;
      for (int year = 1; year <= limit; year++) {
        double annualInterest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) / 100);
        double monthlyInterest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) /
                100 /
                12);
        double BimonthlyInterest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) /
                100 /
                6);
        double quarterlyIntrest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) /
                100 /
                4);
        double thriceyearlyintrest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) /
                100 /
                3);
        double halfyearlyintrest = principalAmount *
            (double.parse(_rateControllerNA.text.replaceAll(',', '')) /
                100 /
                2);
        // log("annualInterest  " + monthlyInterest.toString());
        maturityAmount += (double.parse(
                _depositamountControllerNA.text.replaceAll(',', ''))) +
            (dropdownvalue6 == "Monthly"
                ? monthlyInterest
                : dropdownvalue6 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue6 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue6 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue6 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest);
        // log("maturityAmount  " + maturityAmount.toString());
        principalAmount += (double.parse(
                _depositamountControllerNA.text.replaceAll(',', ''))) +
            (dropdownvalue6 == "Monthly"
                ? monthlyInterest
                : dropdownvalue6 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue6 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue6 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue6 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest); // Add the interest and contribution to the principal for the next year
        // log("principalAmount  " + principalAmount.toString());
      }
      totalInterest = maturityAmount - totalDeposit;
      return maturityAmount;
    }
    return 0;
  }

  double _handleCalculationExistingAccount() {
    if (_accountBalanceControllerEA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Account Balance",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_rateControllerEA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_depositamountControllerEA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (dropdownvalue1.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Select Term Completed",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double principalAmount = double.parse(
              _depositamountControllerEA.text.replaceAll(',', '')) +
          double.parse(_accountBalanceControllerEA.text.replaceAll(',', ''));

      int remainingyear = 15 - int.parse(dropdownvalue1.split(" ").first);
      int limit = 0;
      dropdownvalue5 == "Monthly"
          ? limit = remainingyear * 12
          : dropdownvalue5 == "Bi-Monthly"
              ? limit = remainingyear * 6
              : dropdownvalue5 == "Quarterly"
                  ? limit = remainingyear * 4
                  : dropdownvalue5 == "Thrice Yearly"
                      ? limit = remainingyear * 3
                      : dropdownvalue5 == "Half Yearly"
                          ? limit = remainingyear * 2
                          : limit = remainingyear;
      totalDeposit =
          (double.parse(_depositamountControllerEA.text.replaceAll(',', ''))) *
              limit;
      // log("limit  " + limit.toString());
      maturityAmount =
          double.parse(_accountBalanceControllerEA.text.replaceAll(',', ''));
      for (int year = 1; year <= limit; year++) {
        double annualInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) / 100);
        double monthlyInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                12);
        double BimonthlyInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                6);
        double quarterlyIntrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                4);
        double thriceyearlyintrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                3);
        double halfyearlyintrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                2);
        // log("annualInterest  " + annualInterest.toString());
        // log("principalAmount first  " + principalAmount.toString());
        // log("_depositamountControllerEA   " +
        //     _depositamountControllerEA.text.toString());
        maturityAmount += (double.parse(
                _depositamountControllerEA.text.replaceAll(',', ''))) +
            (dropdownvalue5 == "Monthly"
                ? monthlyInterest
                : dropdownvalue5 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue5 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue5 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue5 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest);
        // log("maturityAmount  " + maturityAmount.toString());
        principalAmount += (double.parse(
                _depositamountControllerEA.text.replaceAll(',', ''))) +
            (dropdownvalue5 == "Monthly"
                ? monthlyInterest
                : dropdownvalue5 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue5 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue5 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue5 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest); // Add the interest and contribution to the principal for the next year
        // log("principalAmount  " + principalAmount.toString());
      }
      totalInterest = maturityAmount -
          double.parse(_accountBalanceControllerEA.text.replaceAll(',', '')) -
          totalDeposit;
      return maturityAmount;
    }
    return 0;
  }

  double _handleCalculationExtent() {
    if (_openingBalanceControllerE.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Opening Balance",
        iconData: Icons.error,
        isError: true,
      );
    } else if (dropdownvalue2.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Select Extenstion Years",
        iconData: Icons.error,
        isError: true,
      );
    } else if (dropdownvalue3.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Select Extenstion Type",
        iconData: Icons.error,
        isError: true,
      );
    } else if (_rateControllerEA.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Intrest Rate.",
        iconData: Icons.error,
        isError: true,
      );
    } else if (dropdownvalue3 == "With Deposits" &&
        _depositamountControllerE.text.isEmpty) {
      showSnackBar(
        context: context,
        message: "Please Enter Deposite Amount.",
        iconData: Icons.error,
        isError: true,
      );
    } else {
      double principalAmount = 0;
      principalAmount = dropdownvalue3 == "With Deposits"
          ? double.parse(_depositamountControllerE.text.replaceAll(',', '')) +
              double.parse(_openingBalanceControllerE.text.replaceAll(',', ''))
          : double.parse(_openingBalanceControllerE.text.replaceAll(',', ''));

      int remainingyear = int.parse(dropdownvalue2.split(" ").first);
      int limit = 0;
      dropdownvalue4 == "Monthly"
          ? limit = remainingyear * 12
          : dropdownvalue4 == "Bi-Monthly"
              ? limit = remainingyear * 6
              : dropdownvalue4 == "Quarterly"
                  ? limit = remainingyear * 4
                  : dropdownvalue4 == "Thrice Yearly"
                      ? limit = remainingyear * 3
                      : dropdownvalue4 == "Half Yearly"
                          ? limit = remainingyear * 2
                          : limit = remainingyear;
      totalDeposit = dropdownvalue3 == "With Deposits"
          ? (double.parse(_depositamountControllerE.text.replaceAll(',', ''))) *
              limit
          : 0;
      // log("limit  " + limit.toString());
      maturityAmount =
          double.parse(_openingBalanceControllerE.text.replaceAll(',', ''));
      for (int year = 1; year <= limit; year++) {
        double annualInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) / 100);
        double monthlyInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                12);
        double BimonthlyInterest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                6);
        double quarterlyIntrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                4);
        double thriceyearlyintrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                3);
        double halfyearlyintrest = principalAmount *
            (double.parse(_rateControllerEA.text.replaceAll(',', '')) /
                100 /
                2);
        // log("annualInterest  " + annualInterest.toString());
        // log("principalAmount first  " + principalAmount.toString());
        // log("_depositamountControllerEA   " +
        //     _depositamountControllerEA.text.toString());
        maturityAmount += dropdownvalue3 == "With Deposits"
            ? (double.parse(
                    _depositamountControllerE.text.replaceAll(',', ''))) +
                (dropdownvalue4 == "Monthly"
                    ? monthlyInterest
                    : dropdownvalue4 == "Bi-Monthly"
                        ? BimonthlyInterest
                        : dropdownvalue4 == "Quarterly"
                            ? quarterlyIntrest
                            : dropdownvalue4 == "Thrice Yearly"
                                ? thriceyearlyintrest
                                : dropdownvalue4 == "Half Yearly"
                                    ? halfyearlyintrest
                                    : annualInterest)
            : (dropdownvalue4 == "Monthly"
                ? monthlyInterest
                : dropdownvalue4 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue4 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue4 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue4 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest);
        // log("maturityAmount  " + maturityAmount.toString());
        principalAmount += dropdownvalue3 == "With Deposits"
            ? (double.parse(
                    _depositamountControllerEA.text.replaceAll(',', ''))) +
                (dropdownvalue4 == "Monthly"
                    ? monthlyInterest
                    : dropdownvalue4 == "Bi-Monthly"
                        ? BimonthlyInterest
                        : dropdownvalue4 == "Quarterly"
                            ? quarterlyIntrest
                            : dropdownvalue4 == "Thrice Yearly"
                                ? thriceyearlyintrest
                                : dropdownvalue4 == "Half Yearly"
                                    ? halfyearlyintrest
                                    : annualInterest)
            : (dropdownvalue4 == "Monthly"
                ? monthlyInterest
                : dropdownvalue4 == "Bi-Monthly"
                    ? BimonthlyInterest
                    : dropdownvalue4 == "Quarterly"
                        ? quarterlyIntrest
                        : dropdownvalue4 == "Thrice Yearly"
                            ? thriceyearlyintrest
                            : dropdownvalue4 == "Half Yearly"
                                ? halfyearlyintrest
                                : annualInterest); // Add the interest and contribution to the principal for the next year
        // log("principalAmount  " + principalAmount.toString());
      }
      totalInterest = maturityAmount -
          double.parse(_openingBalanceControllerE.text.replaceAll(',', '')) -
          totalDeposit;
      return maturityAmount;
    }
    return 0;
  }
}
