// ignore_for_file: file_names

import 'package:emi_calculator/Constants/Color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewSeniorDetaiPage extends StatefulWidget {
  final int amount;
  final int interest;
  const ViewSeniorDetaiPage({
    super.key,
    required this.amount,
    required this.interest,
  });

  @override
  State<ViewSeniorDetaiPage> createState() => _ViewSeniorDetaiPageState();
}

class _ViewSeniorDetaiPageState extends State<ViewSeniorDetaiPage> {
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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: DataTable(
            horizontalMargin: 0,
            columnSpacing: 0,
            // columnSpacing: MediaQuery.of(context).size.width / 6.8,
            columns: [
              DataColumn(
                label: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.25,
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
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Appcolor.primaryColor,
                    child: const Center(
                        child: Text(
                      'Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.white,
                          letterSpacing: 1),
                    ))),
              ),
              DataColumn(
                label: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Appcolor.primaryColor,
                    child: const Center(
                        child: Text(
                      'Interest',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.white,
                          letterSpacing: 1),
                    ))),
              ),
              DataColumn(
                label: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Appcolor.primaryColor,
                    child: const Center(
                        child: Text(
                      'Total Pay',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.white,
                          letterSpacing: 1),
                    ))),
              ),
            ],
            rows: List.generate(6, (index) {
              return 5 > index
                  ? DataRow(cells: [
                      DataCell(Center(
                          child: Text(
                        '${index + 1}',
                        style: const TextStyle(letterSpacing: 1),
                      ))),
                      DataCell(
                        Center(
                          child: Text(
                            index == 0
                                ? '₹ ${formatter.format(widget.amount)}'
                                : "0",
                            style: const TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            '₹ ${formatter.format(widget.interest * 4)}',
                            style: const TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            '₹ ${formatter.format(widget.interest * 4 * (index + 1))}',
                            style: const TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),
                    ])
                  : DataRow(cells: [
                      DataCell(
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            color: Appcolor.primaryColor,
                            child: Center(
                                child: Text(
                              '₹ ${formatter.format(widget.amount)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ))),
                      ),
                      DataCell(
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            color: Appcolor.primaryColor,
                            child: Center(
                                child: Text(
                              '₹ ${formatter.format((widget.interest * 4) * 5)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.white,
                                  letterSpacing: 1),
                            ))),
                      ),
                      DataCell(
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            color: Appcolor.primaryColor,
                            child: Center(
                                child: Text(
                              '₹ ${formatter.format(widget.amount + (widget.interest * 4) * 5)}',
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
