import 'package:conversorFluterando/app/constant/ulr_api_constant.dart';
import 'package:conversorFluterando/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CurrencyModel> currenciesList = [];
  TextEditingController toText = TextEditingController(text: '1.0');
  TextEditingController fromText = TextEditingController();
  CurrencyModel selectedCurrencyTo;
  CurrencyModel selectedCurrencyFrom;

  RxBool awaitingData = true.obs;
  Constant apiURL = Constant();
  void getCurrencies() async {
    currenciesList.clear();
    var response = await http.get(apiURL.apiURL);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['results']['currencies'].forEach((key, value) {
        if (key != 'source') {
          currenciesList.add(CurrencyModel.fromJson(value));
        }
      });

      if (awaitingData.isTrue) {
        selectedCurrencyTo = currenciesList[0];
        selectedCurrencyFrom = currenciesList[1];
      }

      awaitingData = RxBool(false);

      fromText.text = selectedCurrencyFrom.buy.toString();
      myConvert();
      update();
    } else {
      return print('Erro da resposta: ${response.statusCode}');
    }
  }

  void setSelectedCurrencyFunction(CurrencyModel currency, String toOrFrom) {
    if (toOrFrom == 'to') {
      selectedCurrencyTo = currency;
    } else {
      selectedCurrencyFrom = currency;
    }

    myConvert();
  }

  void myConvert() {
    double amountConverteTo = 1.0;
    double amountConverteFrom = 1.0;
    double currencyExchange = 1.0;

    amountConverteTo = double.parse(toText.text) * selectedCurrencyTo.buy;
    amountConverteFrom = double.parse(toText.text) * selectedCurrencyFrom.buy;
    currencyExchange = (amountConverteTo / amountConverteFrom);
    fromText.text =
        (double.parse(toText.text) * currencyExchange).toStringAsFixed(3);

    update();
  }
}
