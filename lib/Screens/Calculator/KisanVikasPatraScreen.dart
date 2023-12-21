// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class KisanVikasPatraScreen extends StatefulWidget {
  const KisanVikasPatraScreen({super.key});

  @override
  State<KisanVikasPatraScreen> createState() => _KisanVikasPatraScreenState();
}

class _KisanVikasPatraScreenState extends State<KisanVikasPatraScreen> {
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _iscalculate = false;
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
          'Kisan Vikas Patra (KVP)',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Interest Rate (%)"),
                        Text("6.9 %"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Term"),
                        Text("10 Year & 4 month"),
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
                            // _handleCalculation();
                            if (_amountController.text.isEmpty) {
                              showSnackBar(
                                context: context,
                                message: "Please Enter Deposit Amount.",
                                iconData: Icons.error,
                                isError: true,
                              );
                            } else {
                              setState(() {
                                _iscalculate = true;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Deposit\n50%",
                            textAlign: TextAlign.center,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.56,
                                decoration: BoxDecoration(
                                    color: Appcolor.red400,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    color: Appcolor.green700,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                              ),
                            ],
                          ),
                          const Text(
                            "Interest\n50%",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Maturity Ammount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.primaryColor,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "₹ ${formatter.format(int.parse(_amountController.text.replaceAll(",", '')) * 2)}",
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
                          Text('₹ ${_amountController.text}'),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Deposit"),
                          Text('₹ ${_amountController.text}'),
                        ],
                      ),
                    ]),
                  ),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }
}
