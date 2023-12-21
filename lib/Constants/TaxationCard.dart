// ignore_for_file: file_names

import 'package:emi_calculator/Configs/TaxationList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/HouseRentScreen.dart';
import 'package:emi_calculator/Screens/Calculator/IncomeTaxScreen.dart';
import 'package:flutter/material.dart';

class TaxationCard extends StatelessWidget {
  final TaxationData taxationData;
  final int index;
  const TaxationCard({super.key, required this.index, required this.taxationData});

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
              builder: (context) => const IncomeTaxScreen(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HouseRentScreen(),
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
                taxationData.logo,
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
              taxationData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
