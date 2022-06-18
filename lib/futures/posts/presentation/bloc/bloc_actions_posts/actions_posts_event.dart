part of 'actions_posts_bloc.dart';

abstract class ActionsPostsEvent extends Equatable {
  const ActionsPostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends ActionsPostsEvent {
  final Post post;

  AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends ActionsPostsEvent {
  final Post post;
  DeletePostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class EditPostEvent extends ActionsPostsEvent {
  final Post post;
  EditPostEvent({required this.post});
  @override
  List<Object> get props => [post];
}
