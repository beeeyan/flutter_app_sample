// ignore_for_file: one_member_abstracts

import '../model/response_result/response_result.dart';

/// dio.dart の abstract class Dio の形式に沿った
/// API クライアントの抽象クラス
abstract class AbstractApiClient {
  Future<ResponseResult> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    // dioに依存している部分は一時的にコメントアウト
    // Options options,
    // CancelToken cancelToken,
    // ProgressCallback onReceiveProgress,
  });

  // Future<ResponseResult> put(
  //   String path, {
  //   Map<String, dynamic> data,
  //   Map<String, dynamic> queryParameters,
  //   Map<String, dynamic> header,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // });

  // Future<ResponseResult> patch(
  //   String path, {
  //   Map<String, dynamic> data,
  //   Map<String, dynamic> queryParameters,
  //   Map<String, dynamic> header,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // });

  // Future<ResponseResult> post(
  //   String path, {
  //   Map<String, dynamic> data,
  //   Map<String, dynamic> queryParameters,
  //   Map<String, dynamic> header,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // });

  // Future<ResponseResult> postDynamicData(
  //   String path, {
  //   dynamic data,
  //   Map<String, dynamic> queryParameters,
  //   Map<String, dynamic> header,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // });

  // Future<ResponseResult> delete(
  //   String path, {
  //   Map<String, dynamic> data,
  //   Map<String, dynamic> queryParameters,
  //   Map<String, dynamic> header,
  //   Options options,
  //   CancelToken cancelToken,
  // });
}
