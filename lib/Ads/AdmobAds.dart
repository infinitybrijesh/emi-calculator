// ignore_for_file: file_names

import 'dart:developer';
import 'dart:io';

import 'package:emi_calculator/Ads/FacebookAds.dart';
import 'package:emi_calculator/Constants/String.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

BannerAd? bannerAd;
bool isBannerAdLoaded = false;

void loadBannerAd() {
  bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: const AdRequest());
  bannerAd!.load();
}

InterstitialAd? interstitialAd;
bool isInterstitialAdLoaded = false;

Future loadInterstitial() async {
  InterstitialAd.load(
    adUnitId: interstitialId,
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        interstitialAd = ad;
        isInterstitialAdLoaded = true;
        
      },
      
      onAdFailedToLoad: (error) {
        interstitialAd!.dispose();
      },
    ),
  );
}

BannerAd? largebannerAd;
bool isBannerLargeAdLoaded = false;

void loadLargeBannerAd({required BuildContext context}) {
  largebannerAd = BannerAd(
      size:
          AdSize(height: 200, width: MediaQuery.of(context).size.width.toInt()),
      adUnitId: bannerId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerLargeAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: const AdRequest());
  largebannerAd!.load();
}

AppOpenAd? appOpenAd;
bool isopenadAdLoaded = false;

void loadAppOpen({required BuildContext context}) {
  loadFacebookInterstitialAd();
  AppOpenAd.load(
    adUnitId: appOpenId,
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;

        // appOpenAd!.show();
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //   builder: (context) {
        //     return const HomeScreen();
        //   },
        // ), (route) => false);

        isopenadAdLoaded = true;
      },
      onAdFailedToLoad: (error) {
        isAdmob
            ? loadInterstitial()
            : FacebookInterstitialAd.showInterstitialAd();
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //   builder: (context) {
        //     return const HomeScreen();
        //   },
        // ), (route) => false);
      },
    ),
    orientation: 1,
  );
}

RewardedAd? rewardedAd;
bool isRewardedAdAdLoaded = false;

Future loadRewardedAd() async {
  RewardedAd.load(
    adUnitId: rewardedID,
    request: const AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (ad) {
        rewardedAd = ad;
        isRewardedAdAdLoaded = true;
      },
      onAdFailedToLoad: (error) {
        log(error.toString());
      },
    ),
  );
}

class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);

  @override
  State<NativeAds> createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;
  bool isErrorNative = false;
  final String _adUnitId =
      Platform.isAndroid ? nativeId : 'ca-app-pub-3940256099942544/3986624511';
  @override
  void initState() {
    loadAd();
    super.initState();
  }

  /// Loads a native ad.
  void loadAd() {
    _nativeAd = NativeAd(
      adUnitId: _adUnitId,
      factoryId: 'listTileSmall',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          setState(() {
            isErrorNative = true;
          });
          log('$NativeAd failedToLoad: $error');
          // ad.dispose();
        },
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (ad) {},
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (ad) {},
        // For iOS only. Called before dismissing a full screen view
        onAdWillDismissScreen: (ad) {},
        // Called when an ad receives revenue value.
        onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return !_nativeAdIsLoaded
        ? const SizedBox()
        : isErrorNative
            ? const facebookNativeBannerAd()
            : Container(
                // decoration: BoxDecoration(
                //     border: Border.all(color: Appcolor.primaryColor, width: 2),
                //     borderRadius: BorderRadius.circular(20)),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width *
                      0.3, // minimum recommended width
                  minHeight: 50, // minimum recommended height
                  maxWidth: MediaQuery.of(context).size.width * 0.98,
                  maxHeight: 70,
                ),
                child: AdWidget(ad: _nativeAd!),
              );
  }
}

class BigNativeAds extends StatefulWidget {
  const BigNativeAds({Key? key}) : super(key: key);

  @override
  State<BigNativeAds> createState() => _BigNativeAdsState();
}

class _BigNativeAdsState extends State<BigNativeAds> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;
  bool isErrorNativeBig = false;

  final String _adUnitId =
      Platform.isAndroid ? nativeId : 'ca-app-pub-3940256099942544/3986624511';
  @override
  void initState() {
    loadAd();
    super.initState();
  }

  /// Loads a native ad.
  void loadAd() {
    _nativeAd = NativeAd(
      adUnitId: _adUnitId,
      factoryId: 'listTileMedium',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          setState(() {
            isErrorNativeBig = true;
          });
          log('$NativeAd failedToLoad: $error');
          // ad.dispose();
        },
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (ad) {},
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (ad) {},
        // For iOS only. Called before dismissing a full screen view
        onAdWillDismissScreen: (ad) {},
        // Called when an ad receives revenue value.
        onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return !_nativeAdIsLoaded
        ? const SizedBox()
        : isErrorNativeBig
            ? const facebookNativeAd()
            : Container(
                // decoration: BoxDecoration(
                //     border: Border.all(color: Appcolor.primaryColor, width: 2),
                //     borderRadius: BorderRadius.circular(20)),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width *
                      0.3, // minimum recommended width
                  minHeight: 50, // minimum recommended height
                  maxWidth: MediaQuery.of(context).size.width * 0.98,
                  maxHeight: 250,
                ),
                child: AdWidget(ad: _nativeAd!),
              );
  }
}
