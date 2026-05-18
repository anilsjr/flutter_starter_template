import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../core/utils/logger.dart';
import '../model/post_model.dart';

final apiClientProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  return ApiClient(dio);
});

final postProvider = StateNotifierProvider<PostNotifier, AsyncValue<List<PostModel>>>((ref) {
  return PostNotifier(ref.watch(apiClientProvider));
});

class PostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  final ApiClient _apiClient;

  PostNotifier(this._apiClient) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    state = const AsyncValue.loading();
    try {
      final posts = await _apiClient.getPosts();
      state = AsyncValue.data(posts);
    } catch (e, stack) {
      AppLogger.e("Error fetching posts", e, stack);
      state = AsyncValue.error(e, stack);
    }
  }
}
