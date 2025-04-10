import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserDetails {
  final UserRepository repository;

  GetUserDetails(this.repository);

  Future<Either<Failure, User>> execute(String userId) async {
    return repository.getUserDetails(userId);
  }
}
