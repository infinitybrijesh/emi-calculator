// ignore_for_file: file_names

import 'package:emi_calculator/Configs/Bank&PostOfficeList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/KisanVikasPatraScreen.dart';
import 'package:emi_calculator/Screens/Calculator/PublicProvidentFundScreen.dart';
import 'package:emi_calculator/Screens/Calculator/SeniorCitizensSavingScreen.dart';
import 'package:emi_calculator/Screens/Calculator/SukanyaSamriddhiScreen.dart';
import 'package:flutter/material.dart';

class BankPostOfficeCard extends StatelessWidget {
  final BankPostOfficeData bankPostOfficeData;
  final int index;
  const BankPostOfficeCard(
      {super.key, required this.index, required this.bankPostOfficeData});

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
              builder: (context) => const PublicProvidentFundScreen(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SukanyaSamriddhiScreen(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SeniorCitizensSavingScreen(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const KisanVikasPatraScreen(),
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
                bankPostOfficeData.logo,
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
              bankPostOfficeData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
