import 'package:api_book/src/app/core/conroller_core.dart';
import 'package:api_book/src/data/models/book.dart';
import 'package:api_book/src/domain/entites/book_response.dart';
import 'package:api_book/src/domain/usecases/fetch_all_books.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends ControllerCore with StateMixin<List<Book>> {
  final BookUseCase bookUseCase;
  HomeController({required this.bookUseCase});
  List<Book> books = [];
  BookResponse bookResponse = BookResponse.empty();
  Dio dio = Dio();
  @override
  void onInit() {
    fetchAllBooks();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  getTestData() async {
    try {
      final response = await dio.get("http://bookstore.local/api/test");
      print(response.data);
    } catch (e) {
      print("Exception get data ${e.toString()}");
    }
  }

  fetchAllBooks() async {
    print("fetchAllBooks");
    change(books, status: RxStatus.loading());
    final result = await bookUseCase.excute(null);
    if (result.isSuccess) {
      print("result is success");
      books = result.bookResponse.books;
      if (result.bookResponse.books.isEmpty) {
        print("result is success empty");
        books = result.bookResponse.books;
        change(books, status: RxStatus.empty());
      } else {
        print("result is success not empty");
        change(books, status: RxStatus.success());
        print(books);
      }
    } else {
      print("result is not success");
      books = result.bookResponse.books;
      change(books, status: RxStatus.error());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
