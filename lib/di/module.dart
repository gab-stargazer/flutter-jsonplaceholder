import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder_album/data/remote/api.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository_impl.dart';
import 'package:json_placeholder_album/domain/usecases/comment_usecases.dart';
import 'package:json_placeholder_album/domain/usecases/comment_usecases_impl.dart';
import 'package:json_placeholder_album/domain/usecases/post_usecases_impl.dart';
import 'package:logger/logger.dart';

import '../domain/usecases/post_usecases.dart';

final getIt = GetIt.instance;

setupDependencies() {
  getIt.registerSingleton(Logger());
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(ApiService(getIt.get()));
  getIt.registerSingleton<JsonPlaceHolderRepository>(JsonPlaceholderRepositoryImpl(apiService: getIt.get()));
  getIt.registerFactory<PostUseCases>(() => PostUseCasesImpl(repository: getIt.get()));
  getIt.registerFactory<CommentUseCases>(() => CommentUseCasesImpl(repository: getIt.get()));
}