import 'package:base_project/core/errors/failure.dart';

class ServerBadResponse extends Failure {
  ServerBadResponse([String message = 'Bad response'])
    : super(message: message);
}
