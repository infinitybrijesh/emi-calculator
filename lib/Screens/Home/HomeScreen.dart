// ignore_for_file: file_names

import 'package:emi_calculator/Constants/ClickCount.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/CustomDialog.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:emi_calculator/Constants/glass.dart';
import 'package:emi_calculator/Screens/Calculator/CalculatorScree.dart';
import 'package:emi_calculator/Screens/EMI/EMIScree.dart';
import 'package:emi_calculator/Screens/News/NewsScreen.dart';
import 'package:emi_calculator/Screens/Privacy%20Policy/privacypolicy.dart';
import 'package:emi_calculator/Screens/SPI/SIPScreen.dart';
import 'package:emi_calculator/Screens/Terms%20and%20Conditions/Terms_and_Conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedItemPosition = 0;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 1,
        leading: InkWell(
            onTap: () {
              _scaffoldkey.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu, color: Appcolor.black)),
        title: const Text(
          'EMI Calculator',
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
        actions: [
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomDialog(
                    title: 'EMI Calculator Help',
                  ),
                );
              },
              child: const Icon(Icons.info, color: Appcolor.black)),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            color: Appcolor.primaryColor,
            child: Image.asset('assets/gif/name.gif'),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 35,
                    width: 35,
                    child: GlassMorphism(
                      color: Appcolor.primaryColor,
                      start: 0,
                      end: 1,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.home),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Dashbord",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Appcolor.grey500,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const privacypolicy(),
              ));
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 35,
                    width: 35,
                    child: GlassMorphism(
                      color: Appcolor.primaryColor,
                      start: 0,
                      end: 1,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.shield),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "privacy policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Appcolor.grey500,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsandConditions(),
              ));
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 35,
                    width: 35,
                    child: GlassMorphism(
                      color: Appcolor.primaryColor,
                      start: 0,
                      end: 1,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.help),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Terms and conditions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Appcolor.grey500,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          Text(
            "v $version",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Appcolor.grey500,
                letterSpacing: 0.5),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
      body: Stack(
        children: [
          if (_selectedItemPosition == 0) const CalculatorScreen(),
          if (_selectedItemPosition == 1) const EMIScreen(),
          if (_selectedItemPosition == 2) const SIPScreen(),
          if (_selectedItemPosition == 3) const NewsScreen(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(12),
        snakeViewColor: Appcolor.primaryColor,
        selectedItemColor: SnakeShape.indicator == SnakeShape.indicator
            ? Appcolor.primaryColor
            : Appcolor.grey200,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) {
          clickCountFunction();
          setState(() => _selectedItemPosition = index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calculator), label: 'Calculator'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handHoldingDollar), label: 'EMI'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.sackDollar), label: 'SIP'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper), label: 'Market'),
        ],
      ),
    );
  }
}
