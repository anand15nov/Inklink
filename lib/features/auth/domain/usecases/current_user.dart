import 'package:fpdart/fpdart.dart';
import 'package:inklink/core/error/failures.dart';
import 'package:inklink/core/usecase/usecase.dart';
import 'package:inklink/core/common/entities/user.dart';
import 'package:inklink/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
