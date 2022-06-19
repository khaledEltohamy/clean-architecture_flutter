import 'package:api_book/src/data/repositories/book_repository_implementation.dart';
import 'package:api_book/src/domain/usecases/fetch_all_books.dart';
import 'package:api_book/src/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print("HOme Binding");
    Get.put<BookRepoIml>(BookRepoIml(remoteDataSource: Get.find()));
    Get.put<BookUseCase>(BookUseCaseImpl(Get.find()));
    Get.put<HomeController>(HomeController(bookUseCase: Get.find()));
  }
}
