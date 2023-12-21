// ignore_for_file: file_names

import 'package:age_calculator/age_calculator.dart';
import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({super.key});

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  final TextEditingController _dateofbirthController = TextEditingController();
  final TextEditingController _ageasonController = TextEditingController();
  DateTime? birthdate;
  DateTime? ageasdate;
  DateTime date = DateTime.now();
  DateTime date1 = DateTime.now();
  DateDuration? duration;
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
          'Age Calculator',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller: _dateofbirthController,
                        readOnly: true,
                        onTap: () async {
                          clickCountFunction();
                          birthdate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime.now());
                          setState(() {
                            date = birthdate!;
                            _dateofbirthController.text =
                                "${birthdate.toString().split(" ").first.split("-")[2]}-${birthdate.toString().split(" ").first.split("-")[1]}-${birthdate.toString().split(" ").first.split("-")[0]}";
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: "Enter Date Of Birth",
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
                        controller: _ageasonController,
                        onTap: () async {
                          clickCountFunction();
                          ageasdate = await showDatePicker(
                              context: context,
                              initialDate: date1,
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime.now());
                          setState(() {
                            date1 = ageasdate!;
                            _ageasonController.text =
                                "${ageasdate.toString().split(" ").first.split("-")[2]}-${ageasdate.toString().split(" ").first.split("-")[1]}-${ageasdate.toString().split(" ").first.split("-")[0]}";
                          });
                        },
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: "Enter Age as on",
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.red400),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _dateofbirthController.clear();
                              _ageasonController.clear();
                              duration = null;
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
                            if (_dateofbirthController.text.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  message: "Please Enter Date Of Birth.",
                                  iconData: Icons.error,
                                  isError: true);
                            } else if (_ageasonController.text.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  message: "Please Enter Age as on.",
                                  iconData: Icons.error,
                                  isError: true);
                            } else {
                              setState(() {
                                duration = AgeCalculator.dateDifference(
                                    fromDate: birthdate!, toDate: ageasdate!);
                              });
                            }
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
            duration == null
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "⦿ Your Age Is",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Appcolor.primaryColor,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      duration!.years.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const Text(
                                      "Year",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      duration!.months.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const Text(
                                      "Month",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      duration!.days.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const Text(
                                      "Day",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Appcolor.primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
            Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Center(child: BigNativeAds()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
