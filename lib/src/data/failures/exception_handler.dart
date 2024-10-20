import 'package:dio/dio.dart';
import 'response_failure.dart';

class ExceptionHandler {
  const ExceptionHandler._(); // Private constructor to prevent instantiation

  /// Handles Dio and non-Dio errors.
  static ResponseFailure handleError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return const ResponseFailure.customFailure(
              'Request to the server was cancelled.');
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const ResponseFailure.tryAgain();
        case DioExceptionType.badResponse:
          return _handleResponseError(error);
        case DioExceptionType.badCertificate:
          return const ResponseFailure.customFailure(
              'Invalid certificate detected.');
        case DioExceptionType.connectionError:
          return const ResponseFailure.checkYourConnectivity(
              'Network error. Please check your connection.');
        default:
          return const ResponseFailure.customFailure(
              'An unexpected error occurred.');
      }
    } else {
      return ResponseFailure.customFailure(
          'Unexpected error: ${error.toString()}');
    }
  }

  /// Handles specific HTTP status codes.
  static ResponseFailure _handleResponseError(DioError error) {
    final statusCode = error.response?.statusCode;

    // Handle specific status codes: 400, 401, 402, 404, and 422
    switch (statusCode) {
      case 400:
        return const ResponseFailure.customFailure(
            'Bad request. Please try again.');
      case 401:
        return const ResponseFailure.unauthorizedUser();
      case 402:
        return _handleGenericError(error);
      case 404:
        return const ResponseFailure.customFailure('Resource not found.');
      case 403:
        return const ResponseFailure.customFailure(
            'Forbidden. You don\'t have permission.');
      case 422:
        return _handleValidationErrors(error); // Handle validation errors
      case 500:
      case 503:
        return const ResponseFailure.tryAgain();
      default:
        return ResponseFailure.customFailure(
            'Received invalid status code: $statusCode');
    }
  }

  /// Handles generic errors that may include a message in the response.
  static ResponseFailure _handleGenericError(DioError error) {
    final responseData = error.response?.data;
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('message')) {
        final message = responseData['message'];
        return ResponseFailure.customFailure(message.toString());
      }
    }

    // Fallback message for generic errors
    return const ResponseFailure.customFailure(
        'An error occurred. Please try again.');
  }

  /// Handles validation errors in the response body for 422 errors.
  static ResponseFailure _handleValidationErrors(DioError error) {
    final responseData = error.response?.data;
    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'] as Map<String, dynamic>;
      final errors = message.entries.map((entry) {
        final field = entry.key;
        final fieldErrors = entry.value as List;
        return '$field: ${fieldErrors.join(', ')}';
      }).toList();

      // Join errors for a single message
      final errorMessage = errors.join('\n');
      return ResponseFailure.customFailure('Validation errors:\n$errorMessage');
    }

    return const ResponseFailure.customFailure('Validation failed.');
  }
}

