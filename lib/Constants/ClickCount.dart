// ignore_for_file: file_names, unrelated_type_equality_checks

import 'dart:developer';

import 'package:emi_calculator/Ads/AdmobAds.dart';
import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future clickCountFunction() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int click = prefs.getInt(clickCount) ?? 1;
  log("Click Count Is $click");
  if (adsClick != '') {
    if (click == int.parse(adsClick)) {
      await prefs.setInt(clickCount, 1);
    } else {
      await prefs.setInt(clickCount, click + 1);
    }
  } else {
    await prefs.setInt(clickCount, 1);
  }
  // click == int.parse(adsClick)
  //     ? await prefs.setInt(clickCount, 1)
  //     : await prefs.setInt(clickCount, click + 1);

  if (adsClick != '') {
    if (click == int.parse(adsClick)) {
      if (interstitialAd == null) {
        null;
      } else {
        isFacebookInterstitialAdLoaded
            ? FacebookInterstitialAd.showInterstitialAd()
            : interstitialAd!.show();
      }
    } else {
      null;
    }
  } else {
    null;
  }
  // click == int.parse(adsClick)
  //     ? interstitialAd == null
  //         ? null
  //         : interstitialAd!.show()
  //     : null;

  if (adsClick != '') {
    if (adsClick == "1" || adsClick == "0") {
      isAdmob ? loadInterstitial() : loadFacebookInterstitialAd();
    } else {
      if (click == int.parse(adsClick) - 2) {
        isAdmob ? loadInterstitial() : loadFacebookInterstitialAd();
      } else {
        null;
      }
    }
  } else {
    null;
  }
  // click == {adsClick == 0 ? 1 : int.parse(adsClick) - 2}
  //     ? loadInterstitial()
  //     : null;
}
