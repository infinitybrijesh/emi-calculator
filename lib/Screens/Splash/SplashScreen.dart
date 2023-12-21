// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:async';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Ads/get_Ad.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:emi_calculator/Models/AdModel.dart';
import 'package:emi_calculator/Screens/Home/HomeScreen.dart';
import 'package:emi_calculator/Screens/Onboarding/MyOnboarding%20.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isshow = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isshow = true;
      });
    });

    Timer(const Duration(seconds: 7), () async {
      appOpenAd == null ? null : appOpenAd!.show();
        final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                bool? gotoOnboarding = prefs.getBool(showOnboarding)??true;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => gotoOnboarding?const MyOnboarding():const HomeScreen(),
          ),
          (route) => false);
    });
  }

  bool isadLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AdsModel>(
          stream: GetAD().Ads,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              interstitialId = snapshot.data!.interstitial;
              bannerId = snapshot.data!.banner;
              nativeId = snapshot.data!.native;
              appOpenId = snapshot.data!.appOpen;
              rewardedID = snapshot.data!.rewarded;
              rewardedInterstitialID = snapshot.data!.rewardedinterstitial;
              applink = snapshot.data!.appLink;
              version = snapshot.data!.appVersion;
              facebook_bannerID = snapshot.data!.facebook_banner;
              facebook_nativeID = snapshot.data!.facebook_native;
              facebook_rewardedID = snapshot.data!.facebook_rewarded;
              facebook_nativebannerID = snapshot.data!.facebook_nativebaner;
              facebook_interstitialId = snapshot.data!.facebook_interstitial;
              isAdmob = snapshot.data!.isAdmob;
              adsClick = snapshot.data!.adsClick;
              second = int.parse(snapshot.data!.second);
              lastUpdate = snapshot.data!.lastUpdate;
              contactInformation = snapshot.data!.contactInformation;
              releaseDate = snapshot.data!.releaseDate;
              isadLoaded
                  ? null
                  : isAdmob
                      ? loadAppOpen(context: context)
                      : loadAppOpenFacebookInterstitialAd(context: context);
              isadLoaded = true;
            }
            // if (snapshot.hasError) {
            //   return Center(child: Text(snapshot.error.toString()));
            // }
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Lottie.asset(
                    'assets/lottie/splash.json',
                    repeat: false,
                    fit: BoxFit.cover,
                  ),
                ),
                isshow
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Lottie.asset(
                            'assets/lottie/loading.json',
                          ),
                        ),
                      )
                    : const SizedBox(),
                isshow
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/gif/name.gif',
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
    );
  }
}
