import 'package:conversorFluterando/app/controllers/home_controller.dart';
import 'package:conversorFluterando/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownAndtextFieldCurrency extends StatelessWidget {
  final String toOrFrom;

  final HomeController _controller = HomeController();

  DropDownAndtextFieldCurrency({Key key, this.toOrFrom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: _controller,
        builder: (_) => Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: 56,
                        child: DropdownButton<CurrencyModel>(
                            iconEnabledColor: Colors.amber,
                            isExpanded: true,
                            underline: Container(
                              height: 1,
                              color: Colors.amber,
                            ),
                            value: toOrFrom == 'to'
                                ? _.selectedCurrencyTo
                                : _.selectedCurrencyFrom,
                            items: _.currenciesList
                                .map((currency) => DropdownMenuItem(
                                    value: currency,
                                    child: Text(currency.name)))
                                .toList(),
                            onChanged: (value) {
                              _.setSelectedCurrencyFunction(value, toOrFrom);
                              _.myConvert();
                            })),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 3,
                      child: TextField(
                        controller: toOrFrom == 'to' ? _.toText : _.fromText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 1.5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        enabled: toOrFrom == 'to' ? true : false,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          _.myConvert();
                        },
                      ))
                ],
              ),
            ));
  }
}
