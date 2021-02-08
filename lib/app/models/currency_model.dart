class CurrencyModel {
  String currencies;
  String name;
  double buy;

  CurrencyModel({this.currencies, this.name, this.buy});

/*
  CurrencyModel.fromJson(Map<String, dynamic> json) {
    currencies = json['currencies'];
    name = json['name'];
    buy = json['buy'];
  }
  */

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      currencies: json['currencies'],
      name: json['name'],
      buy: json['buy'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencies'] = this.currencies;
    data['name'] = this.name;
    data['buy'] = this.buy;
    return data;
  }
}
