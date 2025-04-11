import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/core/errors/server_failure.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:base_project/domain/usercases/get_user_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUserDetails usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUserDetails(mockUserRepository);
  });

  const userId = '1';
  final user = User(id: 1, name: 'Test User', email: 'test@example.com');

  test(
    'GetUserDetails usecase should return user details successfully',
    () async* {
      when(
        mockUserRepository.getUserDetails('userId'),
      ).thenAnswer((_) async => Right(User()));

      final result = await usecase.execute(userId);

      expect(result, Right<Failure, User>(user));
      verify(mockUserRepository.getUserDetails(userId));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );

  test(
    'GetUserDetails usecase should return failure when repository fails',
    () async* {
      when(
        mockUserRepository.getUserDetails(userId),
      ).thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase.execute(userId);

      expect(result, isA<Left<Failure, User>>());
      expect(result, Left<Failure, User>(ServerFailure()));
    },
  );
}
