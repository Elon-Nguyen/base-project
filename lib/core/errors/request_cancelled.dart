import 'package:base_project/core/errors/failure.dart';

class RequestCancelled extends Failure {
  RequestCancelled([String message = 'Request cancelled'])
    : super(message: message);
}
