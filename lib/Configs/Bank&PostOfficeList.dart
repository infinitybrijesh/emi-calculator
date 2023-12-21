// ignore_for_file: non_constant_identifier_names, file_names

class BankPostOfficeData {
  String logo;
  String title;
  BankPostOfficeData({required this.logo, required this.title});
}

List<BankPostOfficeData> BankPostOfficeList = [
  BankPostOfficeData(logo: "PPF", title: "Public Provident Fund"),
  BankPostOfficeData(logo: "SS", title: "Sukanya Samriddhi"),
  BankPostOfficeData(logo: "SC", title: "Senior Citizens"),
  BankPostOfficeData(logo: "KVP", title: "Kisan Vikas Patra"),
];
