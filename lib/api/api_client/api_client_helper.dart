import '../api_exceptions.dart';
import '../model/base_response_data/base_response_data.dart';

  /// レスポンスのステータスコードを検証する。
  /// レスポンスボディに 'message' フィールドがある場合はそれを、
  /// そうでない場合は適当なエラーメッセージを例外型の message に格納してスローする
  void validateResponse({
    required int? statusCode,
    required BaseResponseData data,
  }) {
    final message = data.main['message'] as String?;
    if (statusCode == 400) {
      throw ApiException(message: message);
    }
    if (statusCode == 401) {
      throw UnauthorizedException(message: message);
    }
    if (statusCode == 403) {
      throw ForbiddenException(message: message);
    }
    if (statusCode == 404) {
      throw ApiNotFoundException(message: message);
    }
    // statusCode が null のときはとりあえず 400 番扱いで良いか確認が必要
    // そもそも、それがどのような場合かは特定できていない。
    if ((statusCode ?? 400) >= 400) {
      throw ApiException(message: message);
    }
  }
