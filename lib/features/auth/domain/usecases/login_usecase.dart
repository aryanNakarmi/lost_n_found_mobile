import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/auth/domain/entities/auth_entity.dart';
import 'package:lost_n_found/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecaseParams extends Equatable{
 
  final String username;
  final String password;
  
  const LoginUsecaseParams({

    required this.username, 
    required this.password
    });

  @override
  List<Object?> get props => [

    username,
    password
  ];
}

class RegisterUsecase implements UsecaseWithParams<AuthEntity, LoginUsecaseParams>{
  final IAuthRepository _authRepository;
  RegisterUsecase({
    required IAuthRepository authRepository
  }): _authRepository= authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(LoginUsecaseParams params) {

    return _authRepository.login(params.username, params.password);
  }

} 