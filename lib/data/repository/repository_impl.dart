import 'package:dartz/dartz.dart';

import '../../core/error/error_handler.dart';
import '../../core/error/failure.dart';
import '../../domain/model/login_model.dart';
import '../../domain/repository/repository.dart';
import '../mapper/mapper.dart';
import '../network/network_info.dart';
import '../network/requests/login_request.dart';
import '../data_source/remote_data_source/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, AuthenticationModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
