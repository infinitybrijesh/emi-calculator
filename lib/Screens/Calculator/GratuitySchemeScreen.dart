// ignore_for_file: file_names

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class GratuitySchemeScreen extends StatefulWidget {
  const GratuitySchemeScreen({super.key});

  @override
  State<GratuitySchemeScreen> createState() => _GratuitySchemeScreenState();
}

class _GratuitySchemeScreenState extends State<GratuitySchemeScreen> {
   ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController _lastDrawnMonthlyBasicSalaryController =
      TextEditingController();
  final TextEditingController _lastDrawnMonthlyDAController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var formatter = NumberFormat('#,##,###');
  bool isGovernment = true;
  bool isPrivate = false;

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
          'Gratuity Scheme',
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
                              controller: _lastDrawnMonthlyBasicSalaryController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _lastDrawnMonthlyBasicSalaryController.text = retult;
                                _lastDrawnMonthlyBasicSalaryController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _lastDrawnMonthlyBasicSalaryController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Last Drawn Monthly Basic Salary (₹)",
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
                              controller: _lastDrawnMonthlyDAController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                String retult =
                                    formatter.format(int.parse(value));
                                _lastDrawnMonthlyDAController.text = retult;
                                _lastDrawnMonthlyDAController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _lastDrawnMonthlyDAController
                                            .text.length));
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Last Drawn Monthly DA (Dearness Allowance) (₹)",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Employment Duration"),
                              SizedBox(
                            height: 45,
                            width: 100,
                            child: TextFormField(
                              controller: _yearController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Year",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 100,
                            child: TextFormField(
                              controller: _monthController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                labelText: "Month",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    child: Text(
                                      "Employee",
                                      style: TextStyle(color: Appcolor.black),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ChoiceChip(
                                        label: Text(
                                          " Government ",
                                          style: TextStyle(
                                              color: isGovernment
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isGovernment,
                                        onSelected: (value) {
                                          setState(() {
                                            isPrivate = false;
                                            isGovernment = !isGovernment;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      ChoiceChip(
                                        label: Text(
                                          " Private ",
                                          style: TextStyle(
                                              color: isPrivate
                                                  ? Appcolor.white
                                                  : Appcolor.black),
                                        ),
                                        selectedColor: Appcolor.primaryColor,
                                        selected: isPrivate,
                                        onSelected: (value) {
                                          setState(() {
                                            isGovernment = false;
                                            isPrivate = !isPrivate;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}