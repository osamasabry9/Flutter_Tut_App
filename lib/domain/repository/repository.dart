import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/network/requests/login_request.dart';
import '../model/login_model.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
}
