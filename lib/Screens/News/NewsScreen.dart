// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:emi_calculator/Models/NewsModel.dart';
import 'package:emi_calculator/Widgets/MarketCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<NewsModel?> FechAllData;

  Future<NewsModel?> fetchAllData() async {
    var res = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6ccd5ae61b794c52b0c4722efa211840"));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      NewsModel allData = NewsModel.fromJson(data);
      return allData;
    }
    return null;
  }

  @override
  void initState() {
    FechAllData = fetchAllData();
    fetchAllData.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel?>(
      future: fetchAllData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.articles.length,
            itemBuilder: (context, index) {
              return MarketCard(
                index: index,
                feed: snapshot.data!.articles[index],
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
