import 'package:base_project/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure([String message = 'Something went wrong']) : super(message: message);
}
