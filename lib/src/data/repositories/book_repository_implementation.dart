import 'package:api_book/src/data/datasources/remote_dataSources.dart';
import 'package:api_book/src/data/models/book.dart';
import 'package:api_book/src/domain/entites/book_response.dart';
import 'package:api_book/src/domain/repositories/remote/book_remote_repositories.dart';

class BookRepoIml extends BookRemoteRepositories {
  final RemoteDataSource _api;
  BookRepoIml({required RemoteDataSource remoteDataSource})
      : _api = remoteDataSource;
  @override
  Future<BookResponse> getAllBooks() async {
    final response = await _api.getAllBooks();
    if (response.statusCode == 200) {
      return BookResponse.fromJson(response.data);
    } else {
      return BookResponse.empty();
    }
  }
}
