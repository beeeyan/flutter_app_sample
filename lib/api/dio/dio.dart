import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_sample/api/dio/response_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'connectivity_interceptor.dart';
import 'header_interceptor.dart';
import 'request_interceptor.dart';

/// Dioのインスタンスを各種設定を済ませた状態で提供するプロバイダ
final dioProvider = Provider<Dio>((ref) {
  return customizeDio();
});

Dio customizeDio() {
  return Dio()
    ..httpClientAdapter = IOHttpClientAdapter()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (_) => true,
    )
    ..interceptors.addAll(<Interceptor>[
      HeaderInterceptor(),
      ConnectivityInterceptor(),
      // デバッグモードでは RequestInterceptor を追加
      if (kDebugMode) RequestInterceptor(),
      // デバッグモードでは ResponseInterceptor を追加
      if (kDebugMode) ResponseInterceptor(),
    ]);
}

extension DioErrorTypeExt on DioExceptionType {
  /// DioErrorType がタイムアウトに該当するかどうか
  bool get isTimeout => [
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(this);
}
