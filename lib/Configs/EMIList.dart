// ignore_for_file: non_constant_identifier_names, file_names

class EMIData {
  String logo;
  String title;
  EMIData({required this.logo, required this.title});
}

List<EMIData> EMIList = [
  EMIData(logo: "EMI", title: "Loan (EMI)"),
  EMIData(logo: "RD", title: "Recurring Deposit"),
  EMIData(logo: "FD", title: "Fixed Deposit"),
  EMIData(logo: "FD", title: "Fixed Deposit Interest Payout"),
  EMIData(logo: "LC", title: "Loan Comparision"),
  EMIData(logo: "GST", title: "GST Calculator"),
  EMIData(logo: "CC", title: "Cash Counter"),
  EMIData(logo: "I", title: "Inflation"),
];
