import 'package:clean/futures/posts/doamin/entites/posts.dart';

class PostModel extends Post {
  PostModel(
      {super.id, super.userId, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json["title"],
      body: json["body"]);

  Map<String, dynamic> toJson(PostModel postModel) => {
        'id': postModel.id ?? 0,
        'userId': postModel.userId ?? 0,
        'title': postModel.title,
        'body': postModel.body,
      };
}
