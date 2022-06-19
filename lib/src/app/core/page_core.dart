import 'package:get/get.dart';

import 'screen_core.dart';

abstract class PageCore extends GetPage {
  late String name;
  late ScreenCore screen;
  late Bindings bindingsPage;
  late List<GetMiddleware> middelwares;
  PageCore({
    required String name,
    required ScreenCore screen,
    Bindings? bindingsPage,
    List<GetMiddleware>? middelwares,
  }) : super(
            name: name,
            page: () => screen,
            binding: bindingsPage,
            middlewares: middelwares);
}
