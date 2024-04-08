import 'package:fpdart/fpdart.dart';
import 'package:inklink/core/error/failures.dart';
import 'package:inklink/core/usecase/usecase.dart';
import 'package:inklink/core/common/entities/user.dart';
import 'package:inklink/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String name;
  final String password;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
