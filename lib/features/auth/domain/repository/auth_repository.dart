import 'package:fpdart/fpdart.dart';
import 'package:inklink/core/error/failures.dart';
import 'package:inklink/core/common/entities/user.dart';

abstract interface class AuthRepository {
  // abstract interface : to implement functions like Sing up with google etc
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
}
