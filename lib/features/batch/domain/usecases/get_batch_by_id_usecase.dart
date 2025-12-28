import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/domain/repositories/batch_repository.dart';

class GetBatchByIdUsecaseParams extends Equatable {
    final String batchId;

  const GetBatchByIdUsecaseParams({required this.batchId});
  @override
  // TODO: implement props
  List<Object?> get props => [batchId];

}

class GetBatchByIdUsecase implements UsecaseWithParams<void,GetBatchByIdUsecaseParams> {
    final IBatchRepository _batchRepository;
    GetBatchByIdUsecase(this._batchRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _batchRepository.getBatchbyId(params.batchId);
  }
}