// ignore_for_file: file_names

import 'package:emi_calculator/Configs/OthersList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/AgeCalculatorScreen.dart';
import 'package:emi_calculator/Screens/Calculator/AmountToWords.dart';
import 'package:emi_calculator/Screens/Calculator/CompoundInterestScreenInOthers.dart';
import 'package:emi_calculator/Screens/Calculator/FutureValueScreenInOthers.dart';
import 'package:emi_calculator/Screens/Calculator/PresentValueScreenInOthers.dart';
import 'package:emi_calculator/Screens/Calculator/SimpleInterestScreenInOthers.dart';
import 'package:flutter/material.dart';

class OthersCard extends StatelessWidget {
  final OthersData othersData;
  final int index;
  const OthersCard({super.key, required this.index, required this.othersData});

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
              builder: (context) => const SimpleInterestScreenInOthers(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CompoundInterestScreenInOthers(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FutureValueScreenInOthers(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PresentValueScreenInOthers(),
            ));
          }
          if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AmountToWords(),
            ));
          }
          if (index == 5) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AgeCalculatorScreen(),
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
                othersData.logo,
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
              othersData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
