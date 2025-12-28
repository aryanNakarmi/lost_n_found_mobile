import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';

abstract interface class UsecaseWithParams<SuccessType, Params>{
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UsercaseWithoutParams<SuccesType>{
  Future<Either<Failure, SuccesType>> call();
}