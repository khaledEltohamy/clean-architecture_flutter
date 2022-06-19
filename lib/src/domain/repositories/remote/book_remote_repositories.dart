import 'package:api_book/src/domain/entites/book_response.dart';
import 'package:get/get.dart';

abstract class BookRemoteRepositories extends GetConnect {
  Future<BookResponse> getAllBooks();
}
