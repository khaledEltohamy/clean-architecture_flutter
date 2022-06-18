import 'package:clean/core/network/network_info.dart';
import 'package:clean/futures/posts/data/datasource/local_data_source.dart';
import 'package:clean/futures/posts/data/datasource/remote_data_source.dart';
import 'package:clean/futures/posts/data/repositories/posts_imp_repo.dart';
import 'package:clean/futures/posts/doamin/repositories/posts_repo.dart';
import 'package:clean/futures/posts/doamin/usescase/addposts_usecase.dart';
import 'package:clean/futures/posts/doamin/usescase/deleteposts_usecase.dart';
import 'package:clean/futures/posts/doamin/usescase/editpost_usecase.dart';
import 'package:clean/futures/posts/doamin/usescase/getposts_usecase.dart';
import 'package:clean/futures/posts/presentation/bloc/bloc_actions_posts/actions_posts_bloc.dart';
import 'package:clean/futures/posts/presentation/bloc/bloc_posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {

//Bloc

  getIt.registerFactory(() => PostsBloc(getPostsUseCase: getIt()));

  getIt.registerFactory(
    () => ActionsPostsBloc(
      addPostsUseCase: getIt(),
      editPostsUseCase: getIt(),
      deletePostsUseCase: getIt(),
    ),
  );

// repository

  getIt.registerLazySingleton<PostsRepo>(() => PostsRepoImp(
      localDataSource: getIt(),
      networkInfo: getIt(),
      remoteDataSource: getIt()));

// usecases

  getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));
  getIt.registerLazySingleton(() => AddPostsUseCase(getIt()));
  getIt.registerLazySingleton(() => EditPostsUseCase(getIt()));
  getIt.registerLazySingleton(() => DeletePostsUseCase(getIt()));

//data source

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpHTTP(client: getIt()));

  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpSharedPreferences(sharedPreferences: getIt()));

//core

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(getIt()));

// Extra injection

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());

}
