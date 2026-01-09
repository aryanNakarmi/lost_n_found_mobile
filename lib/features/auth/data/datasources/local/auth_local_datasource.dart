import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/services/hive/hive_service.dart';
import 'package:lost_n_found/core/services/storage/user_session_service.dart';
import 'package:lost_n_found/features/auth/data/datasources/auth_datasource.dart';
import 'package:lost_n_found/features/auth/data/models/auth_hive_model.dart';

final AuthLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref){

  final hiveService =ref.watch(hiveServiceProvider);
  final userSessionService = ref.read(userSesssionServiceProvider);
  return AuthLocalDatasource(
    hiveService: hiveService,
    userSessionService: userSessionService
    );
});
class AuthLocalDatasource implements IAuthDataSource{

  final HiveService _hiveService;
  final UserSesssionService _userSesssionService;
  AuthLocalDatasource({
    required HiveService hiveService, 
    required UserSesssionService userSessionService}):
     _hiveService =hiveService,
     _userSesssionService = userSessionService
    ;


  @override
  Future<AuthHiveModel?> getCurrentUser() async {
    try {
      // No persistent current-user tracking implemented yet; return null by default
      return Future.value(null);
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future<bool> isExistingEmail(String email) {
     try{
    final exists = _hiveService.isExistingEmail(email);
    return Future.value(exists);
   }catch(e){
    return Future.value(false);
   }
  }

  @override
  Future<AuthHiveModel?> login(String email, String password) async {
     try{
    final user = await _hiveService.loginUser(email, password);
    return Future.value(user);
   }catch(e){
    return Future.value(null);
   }
   
  }

  @override
  Future<bool> logout() async{
   try{
   await _hiveService.logoutUser();
    return Future.value(true);
   }catch(e){
    return Future.value(false);
   }
  }

  @override
  Future<bool> register(AuthHiveModel model) async {
   try{
    await _hiveService.registerUser(model);
    return Future.value(true);

   }catch(e){
    return Future.value(false);
   }
  }
}