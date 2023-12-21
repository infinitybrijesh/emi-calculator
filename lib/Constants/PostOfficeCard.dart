// ignore_for_file: file_names

import 'package:emi_calculator/Configs/PostOfficeList.dart';
import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Screens/Calculator/MonthlyIncomeSchemeScreen.dart';
import 'package:emi_calculator/Screens/Calculator/NationalSavingCertificateScreenInPO.dart';
import 'package:emi_calculator/Screens/Calculator/RecurringDepositScreenInPO.dart';
import 'package:emi_calculator/Screens/Calculator/TimeDepositScreenInPO.dart';
import 'package:flutter/material.dart';

class PostOfficeCard extends StatelessWidget {
  final PostOfficeData postOfficeData;
  final int index;
  const PostOfficeCard(
      {super.key, required this.index, required this.postOfficeData});

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
              builder: (context) => const MonthlyIncomeSchemeScreenInPO(),
            ));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RecurringDepositScreenInPO(),
            ));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TimeDepositScreenInPO(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NationalSavingCertificateScreenInPO(),
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
                postOfficeData.logo,
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
              postOfficeData.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }
}
