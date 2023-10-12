import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../model/response_result/response_result.dart';
import 'abstract_api_client.dart';
import 'api_client.dart';

class ApiClientHttp implements AbstractApiClient {
  @override
  Future<ResponseResult> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await http.get(
      Uri.parse(path),
      headers: header as Map<String, String>?,
    ) as Response<dynamic>;
      final baseResponseData = parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
  }
}
