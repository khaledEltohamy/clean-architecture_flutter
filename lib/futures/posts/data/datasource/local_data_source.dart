import 'dart:convert';

import 'package:clean/core/Errors/exception.dart';
import 'package:clean/core/constant/strings.dart';
import 'package:clean/futures/posts/data/model/posts_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<Unit> cahceData(List<PostModel> model);
  Future<List<PostModel>> getChacheData();
}

class LocalDataSourceImpSharedPreferences implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpSharedPreferences({required this.sharedPreferences});
  @override
  Future<Unit> cahceData(List<PostModel> model) {
    List posts_list =
        model.map<Map<String, dynamic>>((post) => post.toJson(post)).toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(posts_list));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getChacheData() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> postsList = decodeJsonData
          .map<PostModel>((post) => PostModel.fromJson(post))
          .toList();
      return Future.value(postsList);
    } else {
      throw ExceptionEmptyCache();
    }
  }
}
