// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class GSTCalculatorScreen extends StatefulWidget {
  const GSTCalculatorScreen({super.key});

  @override
  State<GSTCalculatorScreen> createState() => _GSTCalculatorScreenState();
}

class _GSTCalculatorScreenState extends State<GSTCalculatorScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _iscalculate = false;
  int netAmount = 0;
  int gstAmount = 0;
  int totalAmount = 0;
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
          'GST Calculator',
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
                          labelText: "GST Rate (%)",
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
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.primaryColor),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _addCalculation();
                              _iscalculate = true;
                            });
                          },
                          child: const Text(
                            "    ADD GST (+)    ",
                            style: TextStyle(color: Appcolor.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.primaryColor),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _subtractCalculation();
                              _iscalculate = true;
                            });
                          },
                          child: const Text(
                            "Subtract GST (-)",
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
                                "Net Ammount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.primaryColor,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "₹ ${formatter.format(netAmount)}",
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
                          const Text("GST Amount"),
                          Text('₹ ${formatter.format(gstAmount)}'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Deposit"),
                          Text('₹ ${formatter.format(totalAmount)}'),
                        ],
                      ),
                      const Divider(),
                    ]),
                  ),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }

  _addCalculation() {
    netAmount = int.parse(_amountController.text.replaceAll(",", ''));
    gstAmount = (netAmount * int.parse(_rateController.text)) ~/ 100;
    totalAmount = netAmount + gstAmount;
  }

  _subtractCalculation() {
    totalAmount = int.parse(_amountController.text.replaceAll(",", ''));
    gstAmount = (netAmount * int.parse(_rateController.text)) ~/
        (100 + int.parse(_rateController.text));
    netAmount = totalAmount - gstAmount;
  }
}
