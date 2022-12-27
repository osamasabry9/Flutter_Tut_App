import 'package:clean_architecture_with_mvvm/domain/model/store_details_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}