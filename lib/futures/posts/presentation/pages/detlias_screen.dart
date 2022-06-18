import 'package:clean/futures/posts/presentation/bloc/bloc_actions_posts/actions_posts_bloc.dart';
import 'package:clean/futures/posts/presentation/pages/action_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../doamin/entites/posts.dart';

class DetalisScreen extends StatelessWidget {
  final Post post;
  const DetalisScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Profile")),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${post.id}"),
          Text("${post.title}"),
          Text("${post.body}"),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((_) => ActionScreen(
                                  isEdit: true,
                                  post: post,
                                )))),
                    child: Center(
                      child: Text("Edit"),
                    )),
                OutlinedButton(onPressed: () => null, child: Text("Delete"))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
