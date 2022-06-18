part of 'actions_posts_bloc.dart';

abstract class ActionsPostsState extends Equatable {
  const ActionsPostsState();

  @override
  List<Object> get props => [];
}

class ActionsPostsInitial extends ActionsPostsState {}

class LoadingActionState extends ActionsPostsState {}

class SuccessActionState extends ActionsPostsState {
  final String msg;

  SuccessActionState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class FaliedActionState extends ActionsPostsState {
  final String msg;
  FaliedActionState({required this.msg});
  @override
  List<Object> get props => [msg];
}
