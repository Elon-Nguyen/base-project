import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/core/errors/server_failure.dart';
import 'package:base_project/core/errors/server_not_found.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
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
    } catch (error) {
      if (error is ServerNotFound) {
        return Left(ServerNotFound());
      }

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
