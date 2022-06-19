import 'package:api_book/src/data/repositories/book_repository_implementation.dart';
import 'package:api_book/src/domain/entites/book_response.dart';
import 'package:api_book/src/domain/usecases/base_useCase.dart';

abstract class BookUseCase extends BaseUseCase<FetchAllBooks, void> {}

class BookUseCaseImpl extends BookUseCase {
  final BookRepoIml _bookRepoIml;

  BookUseCaseImpl(this._bookRepoIml);

  @override
  Future<FetchAllBooks> excute(void noParam) async {
    try {
      return FetchAllBooks(bookResponse: await _bookRepoIml.getAllBooks());
    } on Exception catch (e) {
      return FetchAllBooks(bookResponse: BookResponse.empty(), exception: e);
    }
  }
}

class FetchAllBooks extends UseCaseResult {
  final BookResponse bookResponse;
  final Exception? exception;

  FetchAllBooks({required this.bookResponse, this.exception})
      : super(exception: exception);
}
