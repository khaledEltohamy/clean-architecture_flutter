import 'package:clean/core/network/network_info.dart';
import 'package:clean/futures/posts/data/datasource/local_data_source.dart';
import 'package:clean/futures/posts/data/datasource/remote_data_source.dart';
import 'package:clean/futures/posts/data/model/posts_model.dart';
import 'package:clean/futures/posts/doamin/entites/posts.dart';
import 'package:clean/core/Errors/Failure.dart';
import 'package:clean/futures/posts/doamin/repositories/posts_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/exception.dart';

typedef Future<Unit> Action();

class PostsRepoImp extends PostsRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepoImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});


  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isDeviceConnectedInternet) {
      try {
        final remoteData = await remoteDataSource.getAllPosts();
        await localDataSource.cahceData(remoteData);
        return Right(remoteData);
      } on ExceptionService {
        return Left(FaluireService());
      }
    } else {
      try {
        final localData = await localDataSource.getChacheData();
        return Right(localData);
      } on ExceptionEmptyCache {
        return Left(FaluireEmptyCache());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    PostModel postModel = PostModel(title: post.title, body: post.title);
    return await _handelingCheckData(() {
      return remoteDataSource.addPost(postModel);
    });
  }
  
  @override
  Future<Either<Failure, Unit>> deletePost(Post post) async {
    PostModel postModel = PostModel(
        id: post.id, userId: post.userId, title: post.title, body: post.title);
    return await _handelingCheckData(() {
      return remoteDataSource.deletePost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> editPost(Post post) async {
    PostModel postModel = PostModel(
        id: post.id, title: post.title, body: post.title);
    return await _handelingCheckData(() {
      return remoteDataSource.editPost(postModel);
    });
  }


  Future<Either<Failure, Unit>> _handelingCheckData(Action action) async {
    if (await networkInfo.isDeviceConnectedInternet) {
      try {
        await action();
        return Right(unit);
      } on ExceptionService {
        return Left(FaluireService());
      }
    } else {
      return Left(FaluireOffline());
    }
  }
}
