import 'package:api_book/src/presentation/binding/home_binding.dart';
import 'package:api_book/src/presentation/views/screens/home.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static final String home = "/home";
  static final String splash = "/splash";
  static final String main = "/";
}

class DeliveryPage {
  static final pages = [
    GetPage(
        name: DeliveryRoutes.home,
        page: () => HomeScreen(),
        binding: HomeBinding()),
  ];
}
