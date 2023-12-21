
// ignore_for_file: non_constant_identifier_names, file_names

class PostOfficeData {
  String logo;
  String title;
  PostOfficeData({required this.logo, required this.title});
}

List<PostOfficeData> PostOfficeList = [
  PostOfficeData(logo: "MIS", title: "Monthly Income Scheme"),
  PostOfficeData(logo: "RD", title: "Recurring Deposit"),
  PostOfficeData(logo: "TD", title: "Time Deposit"),
  PostOfficeData(logo: "NSC", title: "National Saving Certificate"),
];
