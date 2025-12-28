import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';

class CreateBatchUsecaseParams extends Equatable {
  final String batchName;
  
  const CreateBatchUsecaseParams({required this.batchName});
  @override
  // TODO: implement props
  List<Object?> get props => [batchName];
}

class CreateBatchUsecase implements UsecaseWithParams<void,CreateBatchUsecaseParams>{
  @override
  Future<Either<Failure, void>> call(CreateBatchUsecaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}