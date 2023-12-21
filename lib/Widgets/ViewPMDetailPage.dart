// ignore_for_file: file_names

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewPMDetailPage extends StatefulWidget {
  final int months;
  final String screen;
  const ViewPMDetailPage({
    super.key,
    required this.months,
    required this.screen,
  });

  @override
  State<ViewPMDetailPage> createState() => _ViewPMDetailPageState();
}

class _ViewPMDetailPageState extends State<ViewPMDetailPage> {
  // late double total;
  // double interest = 0;
  // double payment = 0;
  // double totalpayment = 0;
  // double totalintrest = 0;
  // double totalamount = 0;
  var formatter = NumberFormat('#,##,###');

  // @override
  // void initState() {
  //   super.initState();
  //   total = widget.loanamount.toDouble();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'View Detail',
          style: TextStyle(
              color: Appcolor.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        // actions: const [
        //   Icon(Icons.save, color: Appcolor.black),
        //   SizedBox(
        //     width: 15,
        //   ),
        // ],
      ),
      body: widget.screen != "Accident"
          ? SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  // columnSpacing: MediaQuery.of(context).size.width / 6.8,
                  columns: [
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Year',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Premium',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                  ],
                  rows: List.generate((55 - widget.months) + 1, (index) {
                    return (55 - widget.months) > index
                        ? DataRow(cells: [
                            DataCell(Center(
                                child: Text(
                              '${index + 1}',
                              style: const TextStyle(letterSpacing: 1),
                            ))),
                            DataCell(
                              Center(
                                child: Text(
                                  "${widget.months + index + 1}",
                                  style: const TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text(
                                  '₹ 330',
                                  style: TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  '₹ ${formatter.format(330 * (index + 1))}',
                                  style: const TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                          ])
                        : DataRow(cells: [
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: const Center(
                                      child: Text(
                                    'Total',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '${(55 - widget.months)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '₹ ${formatter.format(330 * (55 - widget.months))}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '₹ ${formatter.format(330 * (55 - widget.months))}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                          ]);
                  })),
            ))
          : SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  // columnSpacing: MediaQuery.of(context).size.width / 6.8,
                  columns: [
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Year',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Premium',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                    DataColumn(
                      label: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: Appcolor.primaryColor,
                          child: const Center(
                              child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                                letterSpacing: 1),
                          ))),
                    ),
                  ],
                  rows: List.generate((70 - widget.months) + 1, (index) {
                    return (70 - widget.months) > index
                        ? DataRow(cells: [
                            DataCell(Center(
                                child: Text(
                              '${index + 1}',
                              style: const TextStyle(letterSpacing: 1),
                            ))),
                            DataCell(
                              Center(
                                child: Text(
                                  "${widget.months + index + 1}",
                                  style: const TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text(
                                  '₹ 12',
                                  style: TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  '₹ ${12 * (index + 1)}',
                                  style: const TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                          ])
                        : DataRow(cells: [
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: const Center(
                                      child: Text(
                                    'Total',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '${(70 - widget.months)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '₹ ${12 * (70 - widget.months)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                            DataCell(
                              Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  color: Appcolor.primaryColor,
                                  child: Center(
                                      child: Text(
                                    '₹ ${12 * (70 - widget.months)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.white,
                                        letterSpacing: 1),
                                  ))),
                            ),
                          ]);
                  })),
            )),
    );
  }
}
