import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'data/data_sources/post_data_source.dart';

final getIt = GetIt.instance;
final dio = Dio();

void setupLocator() {
  getIt.registerLazySingleton<PostDataSource>(() => PostDataSource(dio));
}
