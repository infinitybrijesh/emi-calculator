// ignore_for_file: file_names, camel_case_types

import 'dart:developer';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Constants/Color.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

bool isError = false;

class facebookNativeBannerAd extends StatefulWidget {
  const facebookNativeBannerAd({super.key});

  @override
  State<facebookNativeBannerAd> createState() => _facebookNativeBannerAdState();
}

class _facebookNativeBannerAdState extends State<facebookNativeBannerAd> {
  @override
  Widget build(BuildContext context) {
    const NativeAds();
    Widget facebookNativeAd = FacebookNativeAd(
      placementId:
          facebook_nativebannerID, // Replace with your actual placement ID
      adType: NativeAdType.NATIVE_BANNER_AD,
      width: double.infinity,
      height: 100,
      backgroundColor: Appcolor.primaryColor,
      titleColor: Appcolor.grey400,
      descriptionColor: Appcolor.grey200,
      buttonColor: Appcolor.primaryColor,
      buttonTitleColor: Appcolor.white,
      buttonBorderColor: Appcolor.primaryColor,
      keepAlive: true,
      listener: (result, value) {
        if (result == NativeAdResult.ERROR) {
          setState(() {
            isError = true;
          });
        }
      },
    );
    log(isError.toString());
    return isError ? const NativeAds() : facebookNativeAd;
  }
}

class facebookNativeAd extends StatelessWidget {
  const facebookNativeAd({super.key});

  @override
  Widget build(BuildContext context) {
    return FacebookNativeAd(
      placementId: facebook_nativeID,
      adType: NativeAdType.NATIVE_AD,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      keepAlive:
          true, //set true if you do not want adview to refresh on widget rebuild
      keepExpandedWhileLoading:
          false, // set false if you want to collapse the native ad view when the ad is loading
      expandAnimationDuraion:
          300, //in milliseconds. Expands the adview with animation when ad is loaded
      listener: (result, value) {},
    );
  }
}

bool isFacebookInterstitialAdLoaded = false;

void loadFacebookInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    // placementId: "YOUR_PLACEMENT_ID",
    placementId: facebook_interstitialId,
    listener: (result, value) async {
      if (result == InterstitialAdResult.LOADED) {
        isFacebookInterstitialAdLoaded = true;
      }

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        isFacebookInterstitialAdLoaded = false;
        loadFacebookInterstitialAd();
      }
      if (result == InterstitialAdResult.ERROR) {
        loadInterstitial();
      }
    },
  );
}
bool isFacebookInterstitialSplshAdLoaded = false;

void loadFacebookInterstitialSplsshAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    // placementId: "YOUR_PLACEMENT_ID",
    placementId: facebook_interstitialId,
    listener: (result, value) async {
      if (result == InterstitialAdResult.LOADED) {
        isFacebookInterstitialSplshAdLoaded = true;
      }

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        isFacebookInterstitialSplshAdLoaded = false;
        loadFacebookInterstitialAd();
      }
      if (result == InterstitialAdResult.ERROR) {
        loadInterstitial();
        interstitialAd!.show();
      }
    },
  );
}
bool isappOpenFacebookAdLoaded = false;

void loadAppOpenFacebookInterstitialAd({required BuildContext context}) {
  FacebookInterstitialAd.loadInterstitialAd(
    // placementId: "YOUR_PLACEMENT_ID",
    placementId: facebook_interstitialId,
    listener: (result, value) async {
      if (result == InterstitialAdResult.LOADED) {
        isappOpenFacebookAdLoaded = true;
      }

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        isappOpenFacebookAdLoaded = false;
        loadFacebookInterstitialAd();
      }
      if (result == InterstitialAdResult.ERROR) {
        loadAppOpen(context: context);
        appOpenAd!.show();
      }
    },
  );
}
