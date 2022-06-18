import 'package:clean/core/Errors/Failure.dart';
import 'package:clean/core/constant/strings.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../doamin/entites/posts.dart';
import '../../../doamin/usescase/getposts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;
  PostsBloc({required this.getPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPosts) {
        emit(LoadingState());
        final postsCases = await getPostsUseCase();
        emit(_handelCallBackOfState(postsCases));
      } else if (event is RefreshPosts) {
        final postsCases = await getPostsUseCase();
        emit(_handelCallBackOfState(postsCases));
      }
    });
  }

  PostsState _handelCallBackOfState(Either<Failure, List<Post>> either) {
    return either.fold(
        (faliure) => FaliedState(msg: _handelingFiledMassegeCase(faliure)),
        (posts) => SuccessState(posts: posts));
  }

  String _handelingFiledMassegeCase(Failure failure) {
    switch (failure.runtimeType) {
      case FaluireService:
        return SERVER_ERORR;
      case FaluireOffline:
        return OFFLINE_ERROR;
      case FaluireEmptyCache:
        return EMPTY_CACHED_ERORR;
      default:
        return DEFAULT_ERROR;
    }
  }
}
