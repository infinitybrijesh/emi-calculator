// ignore_for_file: camel_case_types

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:flutter/material.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
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
                      "🇵‌🇷‌🇮‌🇻‌🇦‌🇨‌🇾‌   🇵‌🇴‌🇱‌🇮‌🇨‌🇾‌",
                      style: TextStyle(
                        fontSize: 20,
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
                      "𝐏𝐫𝐢𝐯𝐚𝐜𝐲 𝐏𝐨𝐥𝐢𝐜𝐲 𝐟𝐨𝐫 𝐄𝐌𝐈 𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐨𝐫 𝐀𝐩𝐩",
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
                      '◼ Thank you for using the EMI Calculator app "𝐄𝐌𝐈 𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐨𝐫", developed by "𝐈𝐧𝐟𝐢𝐧𝐢𝐭𝐲 𝐃𝐞𝐯𝐞𝐥𝐨𝐩𝐞𝐫𝐬". This Privacy Policy outlines how we collect, use, and safeguard your personal information while you use our App. By installing and using the App, you agree to the terms outlined in this Privacy Policy.',
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
                              '◼ 𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧 𝐖𝐞 𝐂𝐨𝐥𝐥𝐞𝐜𝐭',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "𝐏𝐞𝐫𝐬𝐨𝐧𝐚𝐥 𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧: ",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "- The App does not collect or store any personal information such as your name, email address, or contact details.",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "𝐃𝐞𝐯𝐢𝐜𝐞 𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧: ",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "- We may collect certain device information, including the type of device you use, operating system version, unique device identifiers, and network information. This information is collected to improve the App's performance and provide better user support.",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "𝐔𝐬𝐚𝐠𝐞 𝐃𝐚𝐭𝐚: ",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "- The App may gather anonymous usage data, such as the features you use, the buttons you tap, and the calculations you perform. This data helps us understand user preferences and enhance the App's functionality.",
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
                            '◼ 𝐇𝐨𝐰 𝐖𝐞 𝐔𝐬𝐞 𝐘𝐨𝐮𝐫 𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "𝐀𝐩𝐩 𝐈𝐦𝐩𝐫𝐨𝐯𝐞𝐦𝐞𝐧𝐭: ",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "- We analyze usage patterns and user interactions to identify areas for improvement. This information helps us enhance the user experience and optimize the App's performance.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "𝐀𝐧𝐚𝐥𝐲𝐭𝐢𝐜𝐬: ",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "- We may employ third-party analytics tools to collect and analyze usage statistics. This data helps us gain insights into user behavior, allowing us to make informed decisions about updates and enhancements.",
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
                            '◼ 𝐃𝐚𝐭𝐚 𝐒𝐞𝐜𝐮𝐫𝐢𝐭𝐲',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- Safeguarding your data is important to us. We implement industry-standard security measures to protect your information from unauthorized access, loss, or disclosure. However, please be aware that no data transmission over the internet or electronic storage method is completely secure, and we cannot guarantee absolute security.",
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
                            '◼ 𝐓𝐡𝐢𝐫𝐝-𝐏𝐚𝐫𝐭𝐲 𝐒𝐞𝐫𝐯𝐢𝐜𝐞𝐬',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- The App might contain links to third-party websites or services that are beyond our control. We are not responsible for the privacy practices of these third-party services. We recommend reviewing the privacy policies of any external services you interact with.",
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
                            "◼ 𝐂𝐡𝐢𝐥𝐝𝐫𝐞𝐧'𝐬 𝐏𝐫𝐢𝐯𝐚𝐜𝐲",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- The App is not intended for users under the age of 13. We do not knowingly collect personal information from children. If we discover that we have inadvertently collected information from a child under 13, we will take steps to delete it as soon as possible.",
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
                            '◼ 𝐂𝐡𝐚𝐧𝐠𝐞𝐬 𝐭𝐨 𝐏𝐫𝐢𝐯𝐚𝐜𝐲 𝐏𝐨𝐥𝐢𝐜𝐲',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- We reserve the right to modify or update this Privacy Policy at any time. Changes become effective upon posting the revised Privacy Policy within the App. Your continued use of the App after any changes indicates your acceptance of those changes.",
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
                            '◼ 𝐂𝐨𝐧𝐭𝐚𝐜𝐭 𝐔𝐬',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      '- If you have questions or concerns about this Privacy Policy or our data practices, please contact us at ',
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
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "- By using the EMI Calculator App, you agree to the terms outlined in this Privacy Policy.",
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
                          const Text(
                            "- Please revisit this Privacy Policy periodically for any updates.",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
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
