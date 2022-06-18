import 'package:clean/core/Errors/Failure.dart';
import 'package:clean/futures/posts/data/repositories/posts_imp_repo.dart';
import 'package:clean/futures/posts/doamin/entites/posts.dart';
import 'package:clean/futures/posts/doamin/repositories/posts_repo.dart';
import 'package:dartz/dartz.dart';

class GetPostsUseCase {
  final PostsRepo postsRepo;

  GetPostsUseCase(this.postsRepo);

  Future<Either<Failure, List<Post>>> call() async {
    return await postsRepo.getAllPosts();
  }
}
