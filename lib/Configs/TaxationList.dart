// ignore_for_file: non_constant_identifier_names, file_names

class TaxationData {
  String logo;
  String title;
  TaxationData({required this.logo, required this.title});
}

List<TaxationData> TaxationList = [
  TaxationData(logo: "IT", title: "Income Tax"),
  TaxationData(logo: "HRA", title: "House Rent"),
 
];
