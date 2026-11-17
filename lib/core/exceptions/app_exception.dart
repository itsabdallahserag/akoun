import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  String message;
  int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() => message;

  factory AppException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException(
          message: 'تعذر الاتصال بالخادم، يرجى التحقق من اتصال الإنترنت.',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(dioException.response);

      case DioExceptionType.cancel:
        return UnexpectedException(
          message: 'تم إلغاء الطلب.',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.badCertificate:
        return ServerException(
          message: 'شهادة الأمان غير صالحة.',
          statusCode: dioException.response?.statusCode,
        );

      case DioExceptionType.unknown:
      default:
        if (dioException.error is AppException) {
          return dioException.error as AppException;
        }
        return UnexpectedException(
          message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.',
          statusCode: dioException.response?.statusCode,
        );
    }
  }

  static AppException fromError(dynamic error) {
    if (error is AppException) {
      return error;
    } else if (error is DioException) {
      if (error.error is AppException) {
        return error.error as AppException;
      }
      return AppException.fromDioException(error);
    } else {
      return UnexpectedException(
        message: error?.toString() ?? 'حدث خطأ غير متوقع.',
      );
    }
  }

  static AppException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    if (data is Map<String, dynamic>) {
      // 1) فحص أخطاء التحقق Validation Errors (مثل 422)
      // مثال: {"errors": {"email": ["The email field must be a valid email address."]}}
      if (data['errors'] != null && data['errors'] is Map) {
        final errorsMap = data['errors'] as Map;
        final List<String> errorMessages = [];

        for (var entry in errorsMap.entries) {
          if (entry.value is List && (entry.value as List).isNotEmpty) {
            errorMessages.addAll((entry.value as List).map((e) => e.toString()));
          } else if (entry.value is String) {
            errorMessages.add(entry.value.toString());
          }
        }

        if (errorMessages.isNotEmpty) {
          return ServerException(
            message: errorMessages.first,
            statusCode: statusCode,
          );
        }
      }

      // 2) فحص حقل الرسالة المباشر message
      // مثال: {"message": "The route api/v1/auth/registe could not be found."}
      if (data['message'] != null &&
          data['message'].toString().trim().isNotEmpty) {
        return ServerException(
          message: data['message'].toString(),
          statusCode: statusCode,
        );
      }
    }

    // 3) في حال عدم وجود json مفهوم، نعتمد على كود الـ HTTP
    switch (statusCode) {
      case 400:
        return ServerException(
          message: 'طلب غير صالح (400).',
          statusCode: statusCode,
        );
      case 401:
        return ServerException(
          message: 'غير مصرح لك بالدخول (401).',
          statusCode: statusCode,
        );
      case 403:
        return ServerException(
          message: 'تم رفض الوصول (403).',
          statusCode: statusCode,
        );
      case 404:
        return ServerException(
          message: 'الرابط المطلوب غير موجود (404).',
          statusCode: statusCode,
        );
      case 422:
        return ServerException(
          message: 'البيانات المدخلة غير صحيحة (422).',
          statusCode: statusCode,
        );
      case 500:
      case 502:
      case 503:
        return ServerException(
          message: 'خطأ في الخادم، يرجى المحاولة لاحقاً (500).',
          statusCode: statusCode,
        );
      default:
        return ServerException(
          message: response?.statusMessage ?? 'حدث خطأ أثناء معالجة الطلب.',
          statusCode: statusCode,
        );
    }
  }
}

class ServerException extends AppException {
  ServerException({required super.message, super.statusCode});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.statusCode});
}

class UnexpectedException extends AppException {
  UnexpectedException({required super.message, super.statusCode});
}
