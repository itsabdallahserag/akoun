import 'package:akoun/api/api_constants.dart';
import 'package:akoun/api/dio/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      followRedirects: true,
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      compact: true,
      enabled: true,
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }

  @singleton
  @injectable
  DioInterceptors provideDioInterceptors() {
    return DioInterceptors();
  }

  @singleton
  @injectable
  Dio provideDio(
    BaseOptions baseOptions,
    PrettyDioLogger prettyDioLogger,
    DioInterceptors dioInterceptors,
  ) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(dioInterceptors);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }
}
