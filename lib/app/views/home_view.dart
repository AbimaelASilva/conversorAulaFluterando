import 'package:conversorFluterando/app/components/dropDownAndtextFieldCurrency_component.dart';
import 'package:conversorFluterando/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    if (_controller.awaitingData.isTrue) {
      _controller.getCurrencies();
    }
    return GetBuilder<HomeController>(
        init: _controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Conversor FLUTERANDO'),
            ),
            body: _.awaitingData.isTrue
                ? Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando dados da API, aguarde...'),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: _.awaitingData.isTrue
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 70, left: 30, right: 30),
                              child: Column(
                                children: [
                                  Container(
                                      width: 200,
                                      height: 200,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  DropDownAndtextFieldCurrency(
                                    toOrFrom: 'to',
                                  ),
                                  DropDownAndtextFieldCurrency(
                                    toOrFrom: 'from',
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 60,
                                    child: RaisedButton(
                                        color: Colors.amber,
                                        child: Text(
                                          'CONVERTER',
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                        onPressed: () {
                                          _.myConvert();
                                        }),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
            bottomNavigationBar: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Dev. Abimael Andrade')],
                ),
              ),
            ),
          );
        });
  }
}
