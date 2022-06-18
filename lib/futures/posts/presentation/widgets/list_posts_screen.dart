import 'package:clean/futures/posts/doamin/entites/posts.dart';
import 'package:clean/futures/posts/presentation/pages/detlias_screen.dart';
import 'package:flutter/material.dart';

class ListPostsScreen extends StatelessWidget {
  final List<Post> posts;

  const ListPostsScreen({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c, index) => InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetalisScreen(post: posts[index]))),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text("${posts[index].title}"),
                ),
              ),
            ),
        separatorBuilder: (c, index) => Divider(
              thickness: 1,
              color: Colors.red,
            ),
        itemCount: posts.length);
  }
}
