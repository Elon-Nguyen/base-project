

import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/core/errors/server_failure.dart';
import 'package:base_project/data/datasources/user_remote_data_source.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> getUserDetails(String userId) async {
    try {
      final userModel = await remoteDataSource.getUserDetails(userId);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure(message: "User not found"));
    }
  }
}