// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class CashCounterScreen extends StatefulWidget {
  const CashCounterScreen({super.key});

  @override
  State<CashCounterScreen> createState() => _CashCounterScreenState();
}

class _CashCounterScreenState extends State<CashCounterScreen> {
  final TextEditingController _twothousanController = TextEditingController();
  final TextEditingController _fivehundredController = TextEditingController();
  final TextEditingController _twohundredController = TextEditingController();
  final TextEditingController _onehundredController = TextEditingController();
  final TextEditingController _fiftyController = TextEditingController();
  final TextEditingController _twentyController = TextEditingController();
  final TextEditingController _tenController = TextEditingController();
  final TextEditingController _fiveController = TextEditingController();
  final TextEditingController _twoController = TextEditingController();
  final TextEditingController _oneController = TextEditingController();
  var formatter = NumberFormat('#,##,###');
  int twothousan = 0;
  int fivehundred = 0;
  int twohundred = 0;
  int onehundred = 0;
  int fifty = 0;
  int twenty = 0;
  int ten = 0;
  int five = 0;
  int two = 0;
  int one = 0;
  int total = 0;
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
          'Cash Counter',
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DataTable(columns: [
                  DataColumn(
                    label: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.177,
                        child: const Center(child: Text('RS.'))),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.177,
                        child: const Center(child: Text('Notes'))),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.177,
                        child: const Center(child: Text('Total'))),
                  ),
                ], rows: [
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.2000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            twothousan = value.isEmpty
                                ? 0
                                : int.parse(_twothousanController.text) * 2000;
                          }),
                          controller: _twothousanController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        twothousan == 0 ? "" : formatter.format(twothousan),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            fivehundred = value.isEmpty
                                ? 0
                                : int.parse(_fivehundredController.text) * 500;
                          }),
                          controller: _fivehundredController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        fivehundred == 0 ? "" : formatter.format(fivehundred),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.200',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            twohundred = value.isEmpty
                                ? 0
                                : int.parse(_twohundredController.text) * 200;
                          }),
                          controller: _twohundredController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        twohundred == 0 ? "" : formatter.format(twohundred),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.100',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            onehundred = value.isEmpty
                                ? 0
                                : int.parse(_onehundredController.text) * 100;
                          }),
                          controller: _onehundredController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        onehundred == 0 ? "" : formatter.format(onehundred),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.50',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            fifty = value.isEmpty
                                ? 0
                                : int.parse(_fiftyController.text) * 50;
                          }),
                          controller: _fiftyController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        fifty == 0 ? "" : formatter.format(fifty),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.20',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            twenty = value.isEmpty
                                ? 0
                                : int.parse(_twentyController.text) * 20;
                          }),
                          controller: _twentyController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        twenty == 0 ? "" : formatter.format(twenty),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            ten = value.isEmpty
                                ? 0
                                : int.parse(_tenController.text) * 10;
                          }),
                          controller: _tenController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        ten == 0 ? "" : formatter.format(ten),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            five = value.isEmpty
                                ? 0
                                : int.parse(_fiveController.text) * 5;
                          }),
                          controller: _fiveController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        five == 0 ? "" : formatter.format(five),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            two = value.isEmpty
                                ? 0
                                : int.parse(_twoController.text) * 2;
                          }),
                          controller: _twoController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        two == 0 ? "" : formatter.format(two),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Center(
                      child: Text(
                        'Rs.1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                    DataCell(Center(
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            one = value.isEmpty
                                ? 0
                                : int.parse(_oneController.text) * 1;
                          }),
                          controller: _oneController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          decoration: InputDecoration(
                            labelText: "Notes",
                            contentPadding: const EdgeInsets.only(left: 10),
                            labelStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        one == 0 ? "" : formatter.format(one),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    )),
                  ]),
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 2,
            margin: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Notes"),
                      Text(
                        // total == 0 ? '' : '$total',
                        _twothousanController.text.isEmpty &&
                                _fivehundredController.text.isEmpty &&
                                _twohundredController.text.isEmpty &&
                                _onehundredController.text.isEmpty &&
                                _fiftyController.text.isEmpty &&
                                _twentyController.text.isEmpty &&
                                _tenController.text.isEmpty &&
                                _fiveController.text.isEmpty &&
                                _twoController.text.isEmpty &&
                                _oneController.text.isEmpty
                            ? "0"
                            : formatter.format(int.parse(_twothousanController.text.isEmpty
                                    ? '0'
                                    : _twothousanController.text) +
                                int.parse(_fivehundredController.text.isEmpty
                                    ? "0"
                                    : _fivehundredController.text) +
                                int.parse(_twohundredController.text.isEmpty
                                    ? "0"
                                    : _twohundredController.text) +
                                int.parse(_onehundredController.text.isEmpty
                                    ? "0"
                                    : _onehundredController.text) +
                                int.parse(_fiftyController.text.isEmpty
                                    ? "0"
                                    : _fiftyController.text) +
                                int.parse(_twentyController.text.isEmpty ? "0" : _twentyController.text) +
                                int.parse(_tenController.text.isEmpty ? "0" : _tenController.text) +
                                int.parse(_fiveController.text.isEmpty ? "0" : _fiveController.text) +
                                int.parse(_twoController.text.isEmpty ? "0" : _twoController.text) +
                                int.parse(_oneController.text.isEmpty ? "0" : _oneController.text)),
                        style: const TextStyle(
                          color: Appcolor.primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Value"),
                      Text(
                        // total == 0 ? '' : '$total',
                        _twothousanController.text.isEmpty &&
                                _fivehundredController.text.isEmpty &&
                                _twohundredController.text.isEmpty &&
                                _onehundredController.text.isEmpty &&
                                _fiftyController.text.isEmpty &&
                                _twentyController.text.isEmpty &&
                                _tenController.text.isEmpty &&
                                _fiveController.text.isEmpty &&
                                _twoController.text.isEmpty &&
                                _oneController.text.isEmpty
                            ? "0"
                            : "₹ ${formatter.format(twothousan + fivehundred + twohundred + onehundred + fifty + twenty + ten + five + two + one)}",
                        style: const TextStyle(
                          color: Appcolor.primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("In English"),
                      SizedBox(
                        height: _twothousanController.text.isEmpty &&
                                _fivehundredController.text.isEmpty &&
                                _twohundredController.text.isEmpty &&
                                _onehundredController.text.isEmpty &&
                                _fiftyController.text.isEmpty &&
                                _twentyController.text.isEmpty &&
                                _tenController.text.isEmpty &&
                                _fiveController.text.isEmpty &&
                                _twoController.text.isEmpty &&
                                _oneController.text.isEmpty
                            ? 0
                            : 5,
                      ),
                      _twothousanController.text.isEmpty &&
                              _fivehundredController.text.isEmpty &&
                              _twohundredController.text.isEmpty &&
                              _onehundredController.text.isEmpty &&
                              _fiftyController.text.isEmpty &&
                              _twentyController.text.isEmpty &&
                              _tenController.text.isEmpty &&
                              _fiveController.text.isEmpty &&
                              _twoController.text.isEmpty &&
                              _oneController.text.isEmpty
                          ? const SizedBox()
                          : Text(
                              " ⦿ ${NumberToWordsEnglish.convert(
                                twothousan +
                                    fivehundred +
                                    twohundred +
                                    onehundred +
                                    fifty +
                                    twenty +
                                    ten +
                                    five +
                                    two +
                                    one,
                              )}",
                              style: const TextStyle(
                                color: Appcolor.primaryColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
        ]),
      ),
    );
  }
}
