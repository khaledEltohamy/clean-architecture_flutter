import 'package:bloc/bloc.dart';
import 'package:clean/futures/posts/doamin/usescase/addposts_usecase.dart';
import 'package:clean/futures/posts/doamin/usescase/deleteposts_usecase.dart';
import 'package:clean/futures/posts/doamin/usescase/editpost_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/Errors/Failure.dart';
import '../../../../../core/constant/strings.dart';
import '../../../doamin/entites/posts.dart';

part 'actions_posts_event.dart';
part 'actions_posts_state.dart';

class ActionsPostsBloc extends Bloc<ActionsPostsEvent, ActionsPostsState> {
  final AddPostsUseCase addPostsUseCase;
  final EditPostsUseCase editPostsUseCase;
  final DeletePostsUseCase deletePostsUseCase;
  ActionsPostsBloc(
      {required this.addPostsUseCase,
      required this.editPostsUseCase,
      required this.deletePostsUseCase})
      : super(ActionsPostsInitial()) {
    on<ActionsPostsEvent>((event, emit) async {
     
      if (event is AddPostEvent) {
        final addPostCase = await addPostsUseCase(event.post);
        emit(_handelCallBackOfState(addPostCase, event));
      } 
      else if (event is EditPostEvent) {
        final editPostCase = await editPostsUseCase(event.post);
        emit(_handelCallBackOfState(editPostCase, event));
      }
       else if (event is DeletePostEvent) {
        final deletePostCase = await deletePostsUseCase(event.post);
        emit(_handelCallBackOfState(deletePostCase, event));
      }
    
    });
  }
  ActionsPostsState _handelCallBackOfState(
      Either<Failure, Unit> either, event) {
    return either.fold(
        (faliure) => FaliedActionState(msg: _handelingFiledMassegeCase(faliure)),
        (_) => SuccessActionState(msg: _handelingSuccessMassegeCase(event)));
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

  String _handelingSuccessMassegeCase(ActionsPostsEvent event) {
    switch (event.runtimeType) {
      case AddPostEvent:
        return SUCCESS_MSG_ADD_POST;
      case EditPostEvent:
        return SUCCESS_MSG_EDIT_POST;
      case DeletePostEvent:
        return SUCCESS_MSG_DELETE_POST;
      default:
        return DEFAULT_SUCCESS_MSG;
    }
  }
}
