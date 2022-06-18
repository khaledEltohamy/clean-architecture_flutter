import 'package:clean/futures/posts/presentation/bloc/bloc_posts/posts_bloc.dart';
import 'package:clean/futures/posts/presentation/pages/action_screen.dart';
import 'package:clean/futures/posts/presentation/widgets/errorScreen.dart';
import 'package:clean/futures/posts/presentation/widgets/list_posts_screen.dart';
import 'package:clean/futures/posts/presentation/widgets/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: _buildFloatActionButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: BlocBuilder<PostsBloc, PostsState>(builder: (c, state) {
          if (state is LoadingState) {
            return LoadingScreen();
          } else if (state is FaliedState) {
            return Center(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.error),
                    onPressed: () => _onRefresh(context),
                  ),
                  ErrorScreen(msg: state.msg),
                ],
              ),
            );
          } else if (state is SuccessState) {
            return RefreshIndicator(
              child: ListPostsScreen(posts: state.posts),
              onRefresh: () => _onRefresh(context),
            );
          }
          return LoadingScreen();
        }),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context)..add(RefreshPosts());
  }

  _buildFloatActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ActionScreen(post: null, isEdit: false))));
  }
}
