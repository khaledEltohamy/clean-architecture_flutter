import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? id;
  final int? userId;
  final String title;
  final String body;

  Post(
      { this.id,
        this.userId,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [id, userId, title, body];
}
