import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


//shared pref provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref{

}))
//provider

final userSesssionServiceProvider = Provider<UserSesssionService>((ref){

  return UserSesssionService(prefs: prefs);
});
class UserSesssionService {
  final SharedPreferences _pref;

  UserSesssionService({
    required SharedPreferences prefs
  }): _pref =prefs;
}