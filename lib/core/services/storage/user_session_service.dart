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

  // Keys for storing data

  static const String _keysIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserFullName = 'user_full_name';
  static const String _keyUserPhoneNumber = 'user_phone_number';
  static const String _keyUserBatchId= 'user_batch_id';
  static const String _keyUserProfileImage= 'user_profile_image';
}