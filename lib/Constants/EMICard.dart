// ignore_for_file: file_names

import 'package:emi_calculator/Configs/EMIList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/CashCounterScreen.dart';
import 'package:emi_calculator/Screens/Calculator/FixedDepositInterestPayoutScreen.dart';
import 'package:emi_calculator/Screens/Calculator/FixedDepositScreen.dart';
import 'package:emi_calculator/Screens/Calculator/GSTCalculatorScreen.dart';
import 'package:emi_calculator/Screens/Calculator/InflationScreen.dart';
import 'package:emi_calculator/Screens/Calculator/LoanComparisionScreen.dart';
import 'package:emi_calculator/Screens/Calculator/LoanEmiScreen.dart';
import 'package:emi_calculator/Screens/Calculator/RecurringDepositScreen.dart';
import 'package:flutter/material.dart';

class EMICard extends StatelessWidget {
  final EMIData emiData;
  final int index;
  const EMICard({super.key, required this.index, required this.emiData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.grey100,
      margin: EdgeInsets.only(top: 15, left: 10, right: index.isEven ? 0 : 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          clickCountFunction();
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoanEMIScreen(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RecurringDepositScreen(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FixedDepositScreen(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FixedDepositInterestPayoutScreen(),
            ));
          }
          if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoanComparisionScreen(),
            ));
          }
          if (index == 5) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GSTCalculatorScreen(),
            ));
          }
          if (index == 6) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CashCounterScreen(),
            ));
          }
          if (index == 7) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const InflationScreen(),
            ));
          }
        },
        child: Row(children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: CircleAvatar(
              backgroundColor: Appcolor.white,
              radius: 18,
              child: Text(
                emiData.logo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 14,
                    color: Appcolor.secondarycolor),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Text(
              emiData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
