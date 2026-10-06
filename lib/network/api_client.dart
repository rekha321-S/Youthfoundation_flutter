import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  late Dio _dio;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  bool enableInterceptors;

  ApiClient({this.enableInterceptors = true}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://youthfoundationofindia.in:2019/",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    if (enableInterceptors) {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Retrieve token from secure storage
          String? authToken = await _secureStorage.read(key: "auth_token");
          if (authToken != null) {
            options.headers['Authorization'] = 'Bearer $authToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.statusMessage}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print('Error: ${error.response?.statusCode} - ${error.message}');
          return handler.next(error);
        },
      ));
    }
  }

  // Generic GET request
  Future<ApiResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return _handleResponse<T>(response);
    } catch (e) {
      return ApiResponse.failure(_handleError(e));
    }
  }

  // Generic POST request
  Future<ApiResponse<T>> post<T>(String path, Object data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(contentType: "application/json"),
      );
      return _handleResponse<T>(response);
    } catch (e) {
      return ApiResponse.failure(_handleError(e));
    }
  }

  // Handle API response
  ApiResponse<T> _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      return ApiResponse.success(response.data as T);
    } else {
      return ApiResponse.failure(
          'Unexpected status code: ${response.statusCode}');
    }
  }

  // Handle errors
  String _handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return 'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
      } else {
        return 'Network error: ${error.message}';
      }
    }
    return 'Unexpected error: $error';
  }

  // Save token securely
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: "auth_token", value: token);
  }

  // Get token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: "auth_token");
  }

  // Remove token (Logout)
  Future<void> removeToken() async {
    await _secureStorage.delete(key: "auth_token");
  }
}

// API Response Wrapper
class ApiResponse<T> {
  final T? data;
  final String? errorMessage;

  ApiResponse.success(this.data) : errorMessage = null;
  ApiResponse.failure(this.errorMessage) : data = null;

  bool get isSuccess => data != null && !data.toString().contains("Failed");
}
