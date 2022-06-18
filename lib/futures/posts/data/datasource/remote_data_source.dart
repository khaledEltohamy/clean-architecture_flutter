import 'dart:convert';

import 'package:clean/core/Errors/exception.dart';
import 'package:clean/core/constant/strings.dart';
import 'package:dartz/dartz.dart';
import '../model/posts_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(PostModel post);
  Future<Unit> addPost(PostModel post);
  Future<Unit> editPost(PostModel post);
}

class RemoteDataSourceImpHTTP implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpHTTP({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(BASE_URL + "/posts/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      List<PostModel> posts =
          decodeJson.map((post) => PostModel.fromJson(post)).toList();
      return posts;
    } else {
      throw ExceptionService();
    }
  }

  @override
  Future<Unit> addPost(PostModel post) async {
    final postModelBody = {'title': post.title, 'body': post.body};
    final response =
        await client.post(Uri.parse(BASE_URL + "/posts/"), body: postModelBody);
    if (response.statusCode == 201) {
      return unit;
    } else {
      throw ExceptionService();
    }
  }

  @override
  Future<Unit> deletePost(PostModel post) async {
    String id = post.id.toString();
    final response = await client.delete(Uri.parse(BASE_URL + "/posts/${id}"));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ExceptionService();
    }
  }

  @override
  Future<Unit> editPost(PostModel post) async {
    String id = post.id.toString();
    String userId = post.userId.toString();
    final postModelBody = {'title': post.title, 'body': post.body};
    final response = await client.put(Uri.parse(BASE_URL + "/posts/${id}"),
        body: postModelBody);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ExceptionService();
    }
  }
}

class RemoteDataSourceImpDio implements RemoteDataSource {
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPost(PostModel post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(PostModel post) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> editPost(PostModel post) {
    // TODO: implement editPost
    throw UnimplementedError();
  }
}
