import '../../core/error/failure.dart';
import '../../data/network/requests/login_request.dart';
import '../model/login_model.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class LoginUseCase
    implements BaseUseCase<LoginUseCaseInput, AuthenticationModel> {
  final Repository _repository;

  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
