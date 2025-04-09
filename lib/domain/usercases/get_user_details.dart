import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:base_project/domain/repositories/user_repository.dart';

class GetUserDetails {
  final UserRepository repository;

  GetUserDetails(this.repository);

  Future<Either<Failure, User>> execute(String userId) async {
    print("GetUserDetails execute");
    return await repository.getUserDetails(userId);
  }
}