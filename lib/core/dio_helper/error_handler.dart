import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request to the server was cancelled.";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout with the server.";
        
      case DioExceptionType.sendTimeout:
        return "Send timeout in connection with the server.";
      case DioExceptionType.receiveTimeout:
        return "Connection Timeout";
      case DioExceptionType.connectionError:
        return "Recieve connection error";
       case DioExceptionType.unknown:
        return "Unexpected error occurred: ${error.message}";
      case DioExceptionType.badResponse:
         return "Bad response ${error.message.toString()}"; 
      
      default:
        return "Something went wrong.";
    }
  }
}