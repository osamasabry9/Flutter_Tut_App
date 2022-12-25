import 'package:clean_architecture_with_mvvm/core/error/failure.dart';
import 'package:clean_architecture_with_mvvm/domain/model/home_model.dart';
import 'package:clean_architecture_with_mvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);
  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
