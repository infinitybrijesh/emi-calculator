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

class PMVayaVandhanaScreen extends StatefulWidget {
  const PMVayaVandhanaScreen({super.key});

  @override
  State<PMVayaVandhanaScreen> createState() => _PMVayaVandhanaScreenState();
}

class _PMVayaVandhanaScreenState extends State<PMVayaVandhanaScreen> {
   ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _depositamountController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  String dropdownvalue1 = 'Monthly';
  var items1 = [
    'Monthly',
    'Quaterly',
    'Half Yearly',
    'Yearly',

  ];

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
          'PM Vaya Vandhana Scheme (PMVVS)',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Your Age",
                                hintText: "60 year & above",
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
                              controller: _depositamountController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _depositamountController.text = retult;
                                _depositamountController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _depositamountController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Deposit Amount (₹)",
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
                          const Text("You want to receive Pension:"),
                          const SizedBox(height: 5,),
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
                                    "Term",
                                    style: TextStyle(color: Appcolor.black),
                                  ),
                                  Text(
                                    "10 Years",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Pension Amount",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.42,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Pension Frequency"),
                                            Divider(),
                                            Text("Total Pension Received"),
                                            Divider(),
                                            Text("Maturity Benefit"),
                                          ],
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text("₹..."),
                                          Divider(),
                                          Text(("₹...")),
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
                                      width: MediaQuery.of(context).size.width /
                                          1.25,
                                      child: const Text(
                                          "You will receive pension ₹... yearly till the end of the term.",
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
                                          "You will be receiving a total pension of ₹... during the term of 10 years.",
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
                                          "If you survive till the end of the term, then you will get your deposit amount ₹... back.",
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
                                          "If you die during the term of 10 years, then the pension will be stopped immediately and your nominees or legal heirs will receive the deposit amount ₹... .",
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
      ),
    );
  }

}