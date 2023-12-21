// ignore_for_file: file_names

import 'dart:developer';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class AmountToWords extends StatefulWidget {
  const AmountToWords({super.key});

  @override
  State<AmountToWords> createState() => _AmountToWordsState();
}

class _AmountToWordsState extends State<AmountToWords> {
  final TextEditingController _amountController = TextEditingController();
  var formatter = NumberFormat('#,##,###');
  String convert = "";

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
          'Amount To Words',
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
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          String retult = value.isEmpty
                              ? ""
                              : formatter.format(int.parse(value));
                          _amountController.text = retult;
                          _amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _amountController.text.length));
                          value.isEmpty
                              ? convert = ""
                              : convert = NumberToWordsEnglish.convert(
                                  int.parse(retult.replaceAll(",", "")));
                          log(convert);
                          setState(() {});
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: "Loan Amount (₹)",
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
                  ],
                ),
              ),
            ),
            convert.isEmpty
                ? const SizedBox()
                : Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        convert,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.primaryColor,
                            fontSize: 15,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
            Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                BigNativeAds(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
