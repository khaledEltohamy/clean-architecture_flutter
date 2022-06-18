import 'package:dartz/dartz.dart';

import '../../../../core/Errors/Failure.dart';
import '../entites/posts.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
  Future<Either<Failure, Unit>> editPost(Post post);
}
