import 'package:base_project/core/errors/failure.dart';

class ServerTimeOut extends Failure {
  ServerTimeOut([String message = 'Server timeout']) : super(message: message);
}
