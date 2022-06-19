import 'package:api_book/src/data/repositories/book_repository_implementation.dart';
import 'package:api_book/src/domain/entites/book_response.dart';
import 'package:api_book/src/domain/usecases/fetch_all_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_allBooks_test.mocks.dart';

@GenerateMocks([BookRepoIml])
void main() {
  late BookRepoIml _bookRepo;
  late BookUseCase _bookUseCase;
  setUp(() {
    _bookRepo = MockBookRepoIml();
    _bookUseCase = BookUseCaseImpl(_bookRepo);
  });
  test("should retrun list of books", () async {
    final books = BookResponse.empty();
    when(_bookRepo.getAllBooks()).thenAnswer((realInvocation) async => books);
    final result = await _bookUseCase.excute(null);
    expect(result.bookResponse, BookResponse.empty());
    expect(result.isSuccess, true);
  });

  test("Falied retrun list of books", () async {
    final books = BookResponse.empty();
    when(_bookRepo.getAllBooks()).thenThrow(Exception());
    final result = await _bookUseCase.excute(null);
    expect(result.bookResponse, BookResponse.empty());
    expect(result.isSuccess, false);
  });
}
