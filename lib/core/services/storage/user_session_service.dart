import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


//shared pref provider
final SharedPreferencesProvider = Provider<SharedPreferences>((ref) {
throw UnimplementedError("Shared pref lai hamile main.dart ma initialize garincha ");
});
//provider

final userSesssionServiceProvider = Provider<UserSesssionService>((ref){

  return UserSesssionService(prefs: ref.read(SharedPreferencesProvider));
});

class UserSesssionService {
  final SharedPreferences _pref;

  UserSesssionService({
    required SharedPreferences prefs
  }): _pref =prefs;
}