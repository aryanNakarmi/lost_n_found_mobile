import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/batch_repository.dart';

class UpdateBatchUsecaseParams extends Equatable {
    final BatchEntity batch;

  const UpdateBatchUsecaseParams({required this.batch});
  @override
  // TODO: implement props
  List<Object?> get props => [batch];

}

class UpdateBatchUsecase implements UsecaseWithParams<void,UpdateBatchUsecaseParams> {
    final IBatchRepository _batchRepository;
    UpdateBatchUsecase(this._batchRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _batchRepository.updateBatch(params.batch);
  }
}