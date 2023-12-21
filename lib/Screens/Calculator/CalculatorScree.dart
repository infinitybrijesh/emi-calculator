// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Configs/Bank&PostOfficeList.dart';
import 'package:emi_calculator/Configs/EMIList.dart';
import 'package:emi_calculator/Configs/InsuranceList.dart';
import 'package:emi_calculator/Configs/MutualFundList.dart';
import 'package:emi_calculator/Configs/OthersList.dart';
import 'package:emi_calculator/Configs/PostOfficeList.dart';
import 'package:emi_calculator/Constants/Bank&PostOfficeCard.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/EMICard.dart';
import 'package:emi_calculator/Constants/InsuranceCard.dart';
import 'package:emi_calculator/Constants/MutualFundCard.dart';
import 'package:emi_calculator/Constants/OthersCard.dart';
import 'package:emi_calculator/Constants/PostOfficeCard.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "EMI",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: EMIList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => EMICard(
                    index: index,
                    emiData: EMIList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
          // Card(
          //   elevation: 2,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   margin: const EdgeInsets.all(10),
          //   child: SizedBox(
          //     child: Column(children: [
          //       Container(
          //         decoration: const BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20),
          //           ),
          //           color: Appcolor.primaryColor,
          //         ),
          //         height: 45,
          //         padding: const EdgeInsets.only(left: 25),
          //         child: Row(children: [
          //           Container(
          //             height: 25,
          //             width: 5,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Appcolor.secondarycolor,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           const Text(
          //             "Taxation",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Appcolor.white,
          //                 fontWeight: FontWeight.bold,
          //                 letterSpacing: 2),
          //           ),
          //         ]),
          //       ),
          //       GridView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: TaxationList.length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           childAspectRatio: 2.65,
          //         ),
          //         itemBuilder: (context, index) => TaxationCard(
          //           index: index,
          //           taxationData: TaxationList[index],
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //     ]),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),

          isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "MUTUAL FUND",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: MutualFundList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => MutualFundCard(
                    index: index,
                    mutualFundData: MutualFundList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
         isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Bank & Post Office",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: BankPostOfficeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => BankPostOfficeCard(
                    index: index,
                    bankPostOfficeData: BankPostOfficeList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
          // Card(
          //   elevation: 2,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   margin: const EdgeInsets.all(10),
          //   child: SizedBox(
          //     child: Column(children: [
          //       Container(
          //         decoration: const BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20),
          //           ),
          //           color: Appcolor.primaryColor,
          //         ),
          //         height: 45,
          //         padding: const EdgeInsets.only(left: 25),
          //         child: Row(children: [
          //           Container(
          //             height: 25,
          //             width: 5,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Appcolor.secondarycolor,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           const Text(
          //             "Retirement",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Appcolor.white,
          //                 fontWeight: FontWeight.bold,
          //                 letterSpacing: 2),
          //           ),
          //         ]),
          //       ),
          //       GridView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: RetirementList.length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           childAspectRatio: 2.65,
          //         ),
          //         itemBuilder: (context, index) => RetirementCard(
          //           index: index,
          //           retirementData: RetirementList[index],
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //     ]),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
         isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Post Office",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: PostOfficeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => PostOfficeCard(
                    index: index,
                    postOfficeData: PostOfficeList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
       isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Insurance",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: InsuranceList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => InsuranceCard(
                    index: index,
                    insuranceData: InsuranceList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
       isAdmob ? const NativeAds() : const facebookNativeBannerAd(),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Appcolor.primaryColor,
                  ),
                  height: 45,
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(children: [
                    Container(
                      height: 25,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.secondarycolor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Others",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ]),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: OthersList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.65,
                  ),
                  itemBuilder: (context, index) => OthersCard(
                    index: index,
                    othersData: OthersList[index],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
