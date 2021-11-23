import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:testapp/data/models/response/post_res_model.dart';
import 'package:testapp/data/repositories/post_repository.dart';
import 'package:dio/dio.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState(posts: []));

  PostRepository repository = PostRepository();

  Future<void> postByIdFetch(int id) async {
    emit(state.copyWith(isProgress: true));
    try {
      PostResModel response = await repository.postByIdFetch(id);
      emit(state.copyWith(isSuccess: true, posts: [response]));
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        emit(state.copyWith(
            isFailure: true, isFailureMessage: 'Post not found!'));
      }
    } on SocketException catch (_) {
      emit(state.copyWith(
          isFailure: true,
          isFailureMessage: 'Check your internet connection!'));
    } catch (e) {
      emit(state.copyWith(isFailure: true));
    }
  }

  Future<void> postFetch() async {
    emit(state.copyWith(isProgress: true));
    try {
      List<PostResModel> response = await repository.postFetch();
      emit(state.copyWith(isSuccess: true, posts: response));
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        emit(state.copyWith(
            isFailure: true, isFailureMessage: 'Post not found!'));
      }
    } on SocketException catch (e) {
      emit(state.copyWith(
          isFailure: true, isFailureMessage: 'Check your internet connection'));
    } catch (e) {
      emit(state.copyWith(isFailure: true));
    }
  }
}
