import 'package:api_book/src/presentation/binding/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBinding(),
      getPages: DeliveryPage.pages,
      initialRoute: DeliveryRoutes.home,
    );
  }
}
