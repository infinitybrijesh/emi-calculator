// ignore_for_file: file_names, cast_nullable_to_non_nullable, depend_on_referenced_packages, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class AdsModel {
  String appOpen = '';
  String banner = '';
  String interstitial = '';
  String native = '';
  String rewarded = '';
  String rewardedinterstitial = '';
  String appLink = '';
  String appVersion = '';
  String second = '';
  String facebook_banner = '';
  String facebook_native = '';
  String facebook_interstitial = '';
  String facebook_rewarded = '';
  String facebook_nativebaner = '';
  String adsClick = '';
  bool isAdmob = true;
  DateTime releaseDate = DateTime.now();
  String contactInformation = '';
  DateTime lastUpdate = DateTime.now();

  AdsModel.fromSnapShort(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map;
    
    Timestamp date = data['release_date'];
    Timestamp lastupdate = data['last_update'];
    appOpen =
        data['AppOpen'].toString().isEmpty ? '' : data['AppOpen'].toString();
    banner = data['Banner'].toString().isEmpty ? '' : data['Banner'].toString();
    interstitial = data['Interstitial'].toString().isEmpty
        ? ''
        : data['Interstitial'].toString();
    native = data['Native'].toString().isEmpty ? '' : data['Native'].toString();
    rewarded =
        data['Rewarded'].toString().isEmpty ? '' : data['Rewarded'].toString();
    rewardedinterstitial = data['Rewarded_interstitial'].toString().isEmpty
        ? ''
        : data['Rewarded_interstitial'].toString();
    appLink =
        data['applink'].toString().isEmpty ? '' : data['applink'].toString();
    appVersion = data['appversion'].toString().isEmpty
        ? ''
        : data['appversion'].toString();

    second = data['second'].toString().isEmpty ? '' : data['second'].toString();
    facebook_banner = data['facebook_banner'].toString().isEmpty
        ? ''
        : data['facebook_banner'].toString();
    facebook_interstitial = data['facebook_Interstitial'].toString().isEmpty
        ? ''
        : data['facebook_Interstitial'].toString();
    facebook_native = data['facebook_native'].toString().isEmpty
        ? ''
        : data['facebook_native'].toString();
    facebook_nativebaner = data['facebook_nativebaner'].toString().isEmpty
        ? ''
        : data['facebook_nativebaner'].toString();
    facebook_rewarded = data['facebook_rewarded'].toString().isEmpty
        ? ''
        : data['facebook_rewarded'].toString();
    isAdmob = data['isAdmob'].toString().isEmpty ? true : data['isAdmob'];
    adsClick = data['ads_click'].toString().isEmpty
        ? ''
        : data['ads_click'].toString();
    releaseDate = date.toDate();
    lastUpdate = lastupdate.toDate();
    contactInformation = data['contact_information'].toString().isEmpty
        ? ''
        : data['contact_information'].toString();
  }
}
