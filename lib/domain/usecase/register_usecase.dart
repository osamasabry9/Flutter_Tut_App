import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/network/requests/register_request.dart';
import '../model/login_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, AuthenticationModel> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password,
        input.profilePicture));
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(this.userName, this.countryMobileCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);
}