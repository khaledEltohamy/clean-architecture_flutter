import 'package:api_book/src/app/constant/urls.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  late Dio dio;
  RemoteDataSource() {
    BaseOptions options = BaseOptions(
      headers: {
        "X-RapidAPI-Host": "bookshelves.p.rapidapi.com",
        "X-RapidAPI-Key": "f7eccadbcamsh3e2df2d8e39918ap11f5e7jsne584926445ca",
      },
      baseUrl: BASE_LIST_BOOK,
    );
    dio = Dio(options);
  }
  Future<Response> getAllBooks() async => await dio.get(LIST_BOOKS);
}
