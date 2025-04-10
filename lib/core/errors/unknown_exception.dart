import 'package:base_project/core/errors/failure.dart';

class UnknownException extends Failure {
  UnknownException([String message = 'An unknown error occurred'])
    : super(message: message);
}
