import '../model/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/network/requests/login_request.dart';
import '../../data/network/requests/register_request.dart';
import '../model/login_model.dart';
import '../model/store_details_model.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, AuthenticationModel>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, HomeObject>> getHomeData();
  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
