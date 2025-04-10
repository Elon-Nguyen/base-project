import 'package:base_project/core/errors/failure.dart';

class NetworkException extends Failure {
  NetworkException([String message = 'No internet connection'])
    : super(message: message);
}
