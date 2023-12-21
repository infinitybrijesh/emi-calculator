// ignore_for_file: file_names

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:flutter/material.dart';

class TermsandConditions extends StatefulWidget {
  const TermsandConditions({super.key});

  @override
  State<TermsandConditions> createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/background.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "🇹‌🇪‌🇷‌🇲‌🇸‌   🇦‌🇳‌🇩‌   🇨‌🇴‌🇳‌🇩‌🇮‌🇹‌🇮‌🇴‌🇳‌🇸‌",
                      style: TextStyle(
                        fontSize: 15,
                        color: Appcolor.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                      color: Appcolor.white,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "𝐄𝐌𝐈 𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐨𝐫 𝐀𝐩𝐩 - 𝐓𝐞𝐫𝐦𝐬 𝐚𝐧𝐝 𝐂𝐨𝐧𝐝𝐢𝐭𝐢𝐨𝐧𝐬",
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Effective Date: ",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "${releaseDate.day}-${releaseDate.month}-${releaseDate.year}",
                          style: const TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '◼ Welcome to the EMI Calculator app "𝐄𝐌𝐈 𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐨𝐫". Please read these Terms and Conditions carefully before using the App. By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree with any part of these Terms, please refrain from using the App.',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '◼ 𝐋𝐢𝐜𝐞𝐧𝐬𝐞 𝐀𝐠𝐫𝐞𝐞𝐦𝐞𝐧𝐭:',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- The App is licensed, not sold, to you by the developer for use strictly in accordance with these Terms.",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐔𝐬𝐞 𝐨𝐟 𝐭𝐡𝐞 𝐀𝐩𝐩:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- The App is designed to provide an estimate of Equated Monthly Installments (EMIs) based on user-provided data. The accuracy of the calculated results may vary, and the App shall not be held responsible for any discrepancies or errors.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- You agree to use the App solely for personal and non-commercial purposes. You shall not modify, reverse engineer, or decompile the App.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- You are responsible for the accuracy and completeness of the input data provided to the App.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐏𝐫𝐢𝐯𝐚𝐜𝐲 𝐏𝐨𝐥𝐢𝐜𝐲:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- The App may collect and process personal and non-personal information as described in the Privacy Policy. By using the App, you consent to such data collection and processing.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐔𝐩𝐝𝐚𝐭𝐞𝐬 𝐚𝐧𝐝 𝐂𝐡𝐚𝐧𝐠𝐞𝐬:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- The developer reserves the right to update, modify, or change the features, functionality, or design of the App without prior notice.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- You understand that updates or changes to the App may affect its performance and functionality.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "◼ 𝐈𝐧𝐭𝐞𝐥𝐥𝐞𝐜𝐭𝐮𝐚𝐥 𝐏𝐫𝐨𝐩𝐞𝐫𝐭𝐲:",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- The App, its content, and all related intellectual property rights are owned by the developer. You agree not to use, reproduce, distribute, or create derivative works based on the App without explicit permission from the developer.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐃𝐢𝐬𝐜𝐥𝐚𝐢𝐦𝐞𝐫 𝐨𝐟 𝐖𝐚𝐫𝐫𝐚𝐧𝐭𝐲:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '- The App is provided "as is" and "as available" without any warranties, whether express or implied. The developer disclaims all warranties, including but not limited to, fitness for a particular purpose, accuracy, and non-infringement.',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '- The developer does not guarantee the accuracy, reliability, or completeness of the calculated results provided by the App.',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐋𝐢𝐦𝐢𝐭𝐚𝐭𝐢𝐨𝐧 𝐨𝐟 𝐋𝐢𝐚𝐛𝐢𝐥𝐢𝐭𝐲:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '- The developer shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use or inability to use the App, even if the developer has been advised of the possibility of such damages.',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '- You agree to indemnify and hold harmless the developer from any claims, losses, or damages arising from your use of the App.',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '◼ 𝐓𝐞𝐫𝐦𝐢𝐧𝐚𝐭𝐢𝐨𝐧:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '- The developer reserves the right to terminate your access to the App at any time without prior notice if you violate these Terms or engage in any unauthorized or prohibited activities.',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '◼ 𝐆𝐨𝐯𝐞𝐫𝐧𝐢𝐧𝐠 𝐋𝐚𝐰:',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "- These Terms shall be governed by and construed in accordance with the laws of 𝐂𝐨𝐩𝐲𝐫𝐢𝐠𝐡𝐭© 𝟐𝟎𝟐𝟑. Any disputes arising under or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts in 𝐂𝐨𝐩𝐲𝐫𝐢𝐠𝐡𝐭© 𝟐𝟎𝟐𝟑.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "- By using the EMI Calculator app, you acknowledge that you have read, understood, and agreed to these Terms and Conditions. If you do not agree with any part of these Terms, you should refrain from using the App.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Last updated: ",
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "${lastUpdate.day}-${lastUpdate.month}-${lastUpdate.year}",
                                style: const TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Text(
                                "App Version: ",
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "v$version",
                                style: const TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      '- For any inquiries or concerns regarding these Terms, please contact us at ',
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: contactInformation,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
