import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api_error_messages.dart';
import '../api_exceptions.dart';
import '../model/base_response_data/base_response_data.dart';
import '../model/response_result/response_result.dart';
import 'abstract_api_client.dart';
import 'api_client_helper.dart';

final apiClientHttpProvider = Provider<AbstractApiClient>(
  (ref) => ApiClientHttp(),
);


class ApiClientHttp implements AbstractApiClient {
  @override
  Future<ResponseResult> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(path),
        headers: header as Map<String, String>?,
      );
      final baseResponseData = _parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
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
}

BaseResponseData _parseResponse(Response response) {
  final statusCode = response.statusCode;
  final baseResponseData = BaseResponseData.fromDynamic(response.body);
  validateResponse(statusCode: statusCode, data: baseResponseData);
  return baseResponseData;
}
