import 'package:dio/dio.dart';
import '../../src/model/post_model.dart';
import '../errors/failure.dart';
import '../utils/logger.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient(this._dio, {this.baseUrl = "https://jsonplaceholder.typicode.com/"}) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    
    // Add interceptors for logging
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        AppLogger.i("REQUEST[${options.method}] => PATH: ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger.i("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        AppLogger.e("ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}", e);
        return handler.next(e);
      },
    ));
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dio.get("posts");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw ServerFailure("Failed to load posts: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Failure("An unexpected error occurred: $e");
    }
  }

  // Example POST method
  Future<PostModel> createPost(PostModel post) async {
    try {
      final response = await _dio.post("posts", data: post.toJson());
      if (response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      } else {
        throw ServerFailure("Failed to create post: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Failure("An unexpected error occurred: $e");
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || 
        e.type == DioExceptionType.receiveTimeout || 
        e.type == DioExceptionType.sendTimeout) {
      return NetworkFailure("Connection timed out. Please try again.");
    } else if (e.type == DioExceptionType.connectionError) {
      return NetworkFailure("Network error. Please check your internet connection.");
    } else if (e.response != null) {
      return ServerFailure("Server error: ${e.response?.statusCode}. ${e.response?.statusMessage}");
    } else {
      return Failure("API Error: ${e.message}");
    }
  }
}
