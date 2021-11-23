import 'package:testapp/data/contractors/in_post_repository.dart';
import 'package:testapp/data/data_sources/post_data_source.dart';
import 'package:testapp/data/models/response/post_res_model.dart';
import 'package:testapp/injection.dart';

class PostRepository implements InPostRepository {
  var postDataSource = getIt.get<PostDataSource>();
  @override
  Future<PostResModel> postByIdFetch(int id) async {
    return await postDataSource.postByIdFetch(id);
  }

  @override
  Future<List<PostResModel>> postFetch() async {
    return await postDataSource.postFetch();
  }
}
