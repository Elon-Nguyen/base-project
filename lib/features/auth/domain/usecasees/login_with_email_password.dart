import 'package:base_project/core/domain/entities/user.dart';
import 'package:base_project/core/domain/repositories/user_repository.dart';
import 'package:base_project/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class LoginWithEmailPassword {
  final UserRepository repository;

  LoginWithEmailPassword(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) async {
    return repository.login(email, password);
  }
}
