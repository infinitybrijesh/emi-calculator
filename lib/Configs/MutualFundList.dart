
// ignore_for_file: non_constant_identifier_names, file_names

class MutualFundData {
  String logo;
  String title;
  MutualFundData({required this.logo, required this.title});
}

List<MutualFundData> MutualFundList = [
  MutualFundData(logo: "SIP", title: "Systematic Investment Plan"),
  MutualFundData(logo: "SWP", title: "Systematic Withdrawl Plan"),
  MutualFundData(logo: "LC", title: "Lumpsump Calculator"),
  MutualFundData(logo: "GC", title: "Goal Calculator"),
];
