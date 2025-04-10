import 'package:base_project/core/errors/failure.dart';

class ServerNotFound extends Failure {
  ServerNotFound([String message = 'Resource not found'])
    : super(message: message);
}
