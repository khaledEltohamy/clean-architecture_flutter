import 'package:clean/futures/posts/presentation/bloc/bloc_posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'futures/posts/presentation/bloc/bloc_actions_posts/actions_posts_bloc.dart';
import 'futures/posts/presentation/pages/home_screen.dart';

import 'injection/injection_posts.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dependince injection of app
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>di.getIt<PostsBloc>()..add(GetAllPosts())),
        BlocProvider(create: (_)=> di.getIt<ActionsPostsBloc>()),
      ], 
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    ),);
  }
}
