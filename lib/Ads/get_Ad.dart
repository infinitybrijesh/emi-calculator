// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_calculator/Models/AdModel.dart';

class GetAD {
  Stream<AdsModel> get Ads {
    return FirebaseFirestore.instance
        .collection('EMI')
        .doc('EMI')
        .snapshots()
        .map((e) {
      final AdsModel tvremote = AdsModel.fromSnapShort(e);
      return tvremote;
    });
  }
  Future<AdsModel> fetchAdsData() async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
    .collection('EMI')
    .doc('EMI')
    .get();
  return AdsModel.fromSnapShort(snapshot);

  }
}
