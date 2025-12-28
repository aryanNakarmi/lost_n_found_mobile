import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/batch_repository.dart';


class GetAllBatchUsecaseWithoutParams implements UsecaseWithoutParams {
  final IBatchRepository _batchRepository;

  GetAllBatchUsecaseWithoutParams({required IBatchRepository batchRepository}): _batchRepository = batchRepository;
  
  @override
  Future<Either<Failure, List<BatchEntity>>> call(){
    return _batchRepository.getAllBatches();
  }


}