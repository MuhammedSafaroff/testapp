part of 'post_cubit.dart';

class PostState {
  final List<PostResModel> posts;
  final bool isProgress;
  final bool isFailure;
  final String isFailureMessage;
  final bool isSuccess;

  PostState({
    required this.posts,
    this.isProgress = false,
    this.isFailure = false,
    this.isFailureMessage = 'Unknown error has occurred',
    this.isSuccess = false,
  });

  PostState copyWith({
    List<PostResModel>? posts,
    final bool? isProgress,
    final bool? isFailure,
    final String? isFailureMessage,
    final bool? isSuccess,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      isProgress: isProgress ?? false,
      isFailure: isFailure ?? false,
      isFailureMessage: isFailureMessage ?? 'Unknown error has occurred',
      isSuccess: isSuccess ?? false,
    );
  }
}
