

import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/core/errors/server_failure.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> getUserDetails(String userId) async {
    print("call apit on repository");
    try {
      // final userModel = await remoteDataSource.getUserDetails(userId);
      // return Right(userModel);

      return Right(User(id: "user-id", name: 'User Name', email: 'email@mail.com', ));
    } catch (e) {
      return Left(ServerFailure(message: "User not found"));
    }
  }
}