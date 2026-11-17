import 'package:akoun/core/exceptions/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // تحويل الـ DioException إلى AppException حسب الـ response المستلم
    final appException = AppException.fromDioException(err);

    final customDioException = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: appException,
      message: appException.message,
    );

    handler.next(customDioException);
  }
}
