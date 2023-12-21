// ignore_for_file: file_names

import 'package:emi_calculator/Configs/RetirementList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/AtalPensionSchemeScreen.dart';
import 'package:emi_calculator/Screens/Calculator/EmployeesProvidentFundScreen.dart';
import 'package:emi_calculator/Screens/Calculator/GratuitySchemeScreen.dart';
import 'package:emi_calculator/Screens/Calculator/NationalPensionSchemeScreen.dart';
import 'package:emi_calculator/Screens/Calculator/PMShramYogiMaanDhanScreen.dart';
import 'package:emi_calculator/Screens/Calculator/PMVayaVandhanaScreen.dart';
import 'package:flutter/material.dart';

class RetirementCard extends StatelessWidget {
  final RetirementData retirementData;
  final int index;
  const RetirementCard({super.key, required this.index, required this.retirementData});

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
              builder: (context) => const NationalPensionSchemeScreen(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EmployeesProvidentFundScreen(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AtalPensionSchemeScreen(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PMShramYogiMaanDhanScreen(),
            ));
          }
          if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PMVayaVandhanaScreen(),
            ));
          }
          if (index == 5) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GratuitySchemeScreen(),
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
                retirementData.logo,
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
              retirementData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
