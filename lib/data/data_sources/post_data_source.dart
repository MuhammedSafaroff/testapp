import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testapp/config/configs.dart';
import 'package:testapp/data/models/response/post_res_model.dart';

part 'post_data_source.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class PostDataSource {
  factory PostDataSource(Dio dio, {String baseUrl}) = _PostDataSource;

  @GET('/posts/{id}')
  Future<PostResModel> postByIdFetch(
    @Path() int id,
  );

  @GET('/posts/')
  Future<List<PostResModel>> postFetch();
}
