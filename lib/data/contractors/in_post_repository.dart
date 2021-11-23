import 'package:testapp/data/models/response/post_res_model.dart';

abstract class InPostRepository {
  Future<PostResModel> postByIdFetch(int id);
  Future<List<PostResModel>> postFetch();
}
