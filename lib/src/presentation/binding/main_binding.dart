import 'package:api_book/src/data/datasources/remote_dataSources.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource());
  }
}
