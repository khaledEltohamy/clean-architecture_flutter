part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingState extends PostsState {}

class SuccessState extends PostsState {
  final List<Post> posts;

  const SuccessState({required this.posts});
  
  @override
  List<Object> get props => [posts];
}

class FaliedState extends PostsState {
  final String msg;

  const FaliedState({required this.msg});
  
  @override
  List<Object> get props => [msg];
}
