import 'package:equatable/equatable.dart';

class BaseBook extends Equatable {
  final int id;
  final String title;
  final String cover;
  final String url;
  final String author;
  final String rate;
  final String price;
  final String description;

  BaseBook(
      {required this.id,
      required this.title,
      required this.cover,
      required this.url,
      required this.author,
      required this.rate,
      required this.price,
      required this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
