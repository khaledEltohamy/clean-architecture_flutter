import 'package:api_book/src/domain/entites/base_author.dart';
import 'package:api_book/src/domain/entites/base_book.dart';
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final String cover;
  final String url;
  final String author;
  final String rate;
  final String price;
  final String description;
  Book({
    required this.id,
    required this.title,
    required this.cover,
    required this.url,
    required this.author,
    required this.rate,
    required this.price,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"] ?? "",
        cover: json["imgUrl"],
        price: json["price"],
        rate: json["review"],
        description: json["description"],
        url: json["source"],
      );

  @override
  List<Object?> get props =>
      [id, title, cover, url, author, rate, price, description];
}

class Books {
  final List<Book> books;

  Books({required this.books});
  factory Books.fromJson(Map<String, dynamic> json) =>
      Books(books: List.from(json["Books"].map((book) => Book.fromJson(book))));
}
