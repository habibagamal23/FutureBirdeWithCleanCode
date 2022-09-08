import 'package:future_bride/data/network/failur.dart';
import 'package:dartz/dartz.dart';
import 'package:future_bride/data/network/loginrequest.dart';
import 'package:future_bride/domain/models/models.dart';
import 'package:future_bride/domain/repostry/repositry.dart';
import 'package:future_bride/domain/useCase/baseUseCase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
