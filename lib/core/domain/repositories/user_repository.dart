import 'package:base_project/core/domain/entities/user.dart';
import 'package:base_project/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> getUserDetails(String userId);
}
