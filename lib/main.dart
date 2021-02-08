import 'package:conversorFluterando/app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomeView(),
    theme: ThemeData.dark(),
  ));
}
