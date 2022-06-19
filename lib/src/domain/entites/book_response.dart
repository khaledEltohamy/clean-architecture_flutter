import 'package:api_book/src/data/models/book.dart';
import 'package:equatable/equatable.dart';

class BookResponse extends Equatable {
  // final String statusCode;
  // final int totalResults;
  final List<Book> books;

  BookResponse({required this.books});

  BookResponse.empty({this.books = const []});

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        books: List<Book>.from(
          json["Books"]?.map(
            (book) => Book.fromJson(book),
          ),
        ).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [books];
}
