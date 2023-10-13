import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_error_messages.dart';
import '../api_exceptions.dart';
import '../dio/connectivity_interceptor.dart';
import '../dio/dio.dart';
import '../model/base_response_data/base_response_data.dart';
import '../model/response_result/response_result.dart';
import 'abstract_api_client.dart';
import 'api_client_helper.dart';

final apiClientProvider = Provider<AbstractApiClient>(
  (ref) => ApiClient(
    ref.watch(dioProvider),
  ),
);

class ApiClient implements AbstractApiClient {
  ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<ResponseResult> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    // Options? options,
    // CancelToken? cancelToken,
    // ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        // options: options ?? Options(headers: header),
        // cancelToken: cancelToken,
        // onReceiveProgress: onReceiveProgress,
      );
      final baseResponseData = _parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
    } on DioException catch (dioError) {
      final exception = _handleDioError(dioError);
      return ResponseResult.failure(
        message: exception.toString(),
      );
    } on ApiException catch (e) {
      return ResponseResult.failure(
        message: e.message ?? e.toString(),
      );
    } on SocketException {
      return const ResponseResult.failure(
        message: networkNotConnected,
      );
    } on FormatException {
      return const ResponseResult.failure(
        message: responseFormatNotValid,
      );
    } on Exception catch (e) {
      return ResponseResult.failure(message: e.toString());
    }
  }

  // @override
  // Future<ResponseResult> post(
  //   String path, {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? header,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     final response = await _dio.post<dynamic>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options ?? Options(headers: header),
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     final baseResponseData = _parseResponse(response);
  //     return ResponseResult.success(data: baseResponseData);
  //   } on DioException catch (dioError) {
  //     final exception = _handleDioError(dioError);
  //     return ResponseResult.failure(
  //       message: exception.toString(),
  //     );
  //   } on ApiException catch (e) {
  //     return ResponseResult.failure(
  //       message: e.message ?? e.toString(),
  //     );
  //   } on SocketException {
  //     return const ResponseResult.failure(
  //       message: networkNotConnected,
  //     );
  //   } on FormatException {
  //     return const ResponseResult.failure(
  //       message: responseFormatNotValid,
  //     );
  //   } on Exception catch (e) {
  //     return ResponseResult.failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<ResponseResult> postDynamicData(
  //   String path, {
  //   dynamic data,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? header,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     final response = await _dio.post<dynamic>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options ?? Options(headers: header),
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     final baseResponseData = _parseResponse(response);
  //     return ResponseResult.success(data: baseResponseData);
  //   } on DioException catch (dioError) {
  //     final exception = _handleDioError(dioError);
  //     return ResponseResult.failure(
  //       message: exception.toString(),
  //     );
  //   } on ApiException catch (e) {
  //     return ResponseResult.failure(
  //       message: e.message ?? e.toString(),
  //     );
  //   } on SocketException {
  //     return const ResponseResult.failure(
  //       message: networkNotConnected,
  //     );
  //   } on FormatException {
  //     return const ResponseResult.failure(
  //       message: responseFormatNotValid,
  //     );
  //   } on Exception catch (e) {
  //     return ResponseResult.failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<ResponseResult> patch(
  //   String path, {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? header,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     final response = await _dio.patch<dynamic>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options ?? Options(headers: header),
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     final baseResponseData = _parseResponse(response);
  //     return ResponseResult.success(data: baseResponseData);
  //   } on DioException catch (dioError) {
  //     final exception = _handleDioError(dioError);
  //     return ResponseResult.failure(
  //       message: exception.toString(),
  //     );
  //   } on ApiException catch (e) {
  //     return ResponseResult.failure(
  //       message: e.message ?? e.toString(),
  //     );
  //   } on SocketException {
  //     return const ResponseResult.failure(
  //       message: networkNotConnected,
  //     );
  //   } on FormatException {
  //     return const ResponseResult.failure(
  //       message: responseFormatNotValid,
  //     );
  //   } on Exception catch (e) {
  //     return ResponseResult.failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<ResponseResult> put(
  //   String path, {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? header,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onSendProgress,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   try {
  //     final response = await _dio.put<dynamic>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options ?? Options(headers: header),
  //       cancelToken: cancelToken,
  //       onSendProgress: onSendProgress,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     final baseResponseData = _parseResponse(response);
  //     return ResponseResult.success(data: baseResponseData);
  //   } on DioException catch (dioError) {
  //     final exception = _handleDioError(dioError);
  //     return ResponseResult.failure(
  //       message: exception.toString(),
  //     );
  //   } on ApiException catch (e) {
  //     return ResponseResult.failure(
  //       message: e.message ?? e.toString(),
  //     );
  //   } on SocketException {
  //     return const ResponseResult.failure(
  //       message: networkNotConnected,
  //     );
  //   } on FormatException {
  //     return const ResponseResult.failure(
  //       message: responseFormatNotValid,
  //     );
  //   } on Exception catch (e) {
  //     return ResponseResult.failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<ResponseResult> delete(
  //   String path, {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? header,
  //   Options? options,
  //   CancelToken? cancelToken,
  // }) async {
  //   try {
  //     final response = await _dio.delete<dynamic>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options ?? Options(headers: header),
  //       cancelToken: cancelToken,
  //     );
  //     final baseResponseData = _parseResponse(response);
  //     return ResponseResult.success(data: baseResponseData);
  //   } on DioException catch (dioError) {
  //     final exception = _handleDioError(dioError);
  //     return ResponseResult.failure(
  //       message: exception.toString(),
  //     );
  //   } on ApiException catch (e) {
  //     return ResponseResult.failure(
  //       message: e.message ?? e.toString(),
  //     );
  //   } on SocketException {
  //     return const ResponseResult.failure(
  //       message: networkNotConnected,
  //     );
  //   } on FormatException {
  //     return const ResponseResult.failure(
  //       message: responseFormatNotValid,
  //     );
  //   } on Exception catch (e) {
  //     return ResponseResult.failure(message: e.toString());
  //   }
  // }

  /// DioError を受けて、何かしらの Exception を return する。
  /// 呼び出し側ではそれをスローする。
  Exception _handleDioError(DioException dioError) {
    final errorType = dioError.type;
    final errorResponse = dioError.response;
    final dynamic error = dioError.error;
    if (errorType.isTimeout) {
      return const ApiTimeoutException();
    }
    if (error is ErrorCode && error == ErrorCode.networkNotConnected) {
      return const NetworkNotConnectedException();
    }
    if (errorResponse == null) {
      return const ApiException();
    }
    return const ApiException();
  }
}

  /// Dio の Response を受け取り、dynamic 型のレスポンスボディを BaseResponseData に変換して返す。
  BaseResponseData _parseResponse(Response<dynamic> response) {
    final statusCode = response.statusCode;
    final baseResponseData = BaseResponseData.fromDynamic(response.data);
    validateResponse(statusCode: statusCode, data: baseResponseData);
    return baseResponseData;
  }
