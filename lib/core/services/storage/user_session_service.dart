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
  static const String _keyUsername = 'username';
  static const String _keyUserFullName = 'user_full_name';
  static const String _keyUserPhoneNumber = 'user_phone_number';
  static const String _keyUserBatchId= 'user_batch_id';
  static const String _keyUserProfileImage= 'user_profile_image';


  //store user session data
  Future<void> saveUserSession({
    required String userId,
    required String email,
    required String username,
    required String fullName,
    required String? phoneNumber,
    required String? batchId,
    String? profileImage,
    
  }) async {
    await _pref.setBool(_keysIsLoggedIn, true);
    await _pref.setString(_keyUserId, userId);
    await _pref.setString(_keyUserEmail, email);
    await _pref.setString(_keyUsername, username);
    await _pref.setString(_keyUserFullName, fullName);
    if( phoneNumber != null){
    await _pref.setString(_keyUserPhoneNumber, phoneNumber);
    }
    if( batchId != null){
    await _pref.setString(_keyUserBatchId, batchId);
    }
    if( profileImage != null){
    await _pref.setString(_keyUserProfileImage, profileImage);
    }
  }


  //clear user session data
  Future<void> clearUserSession() async {
    await _pref.remove(_keyUserBatchId);
    await _pref.remove(_keyUserPhoneNumber);
    await _pref.remove(_keyUserFullName);
    await _pref.remove(_keyUsername);
    await _pref.remove(_keyUserEmail);
    await _pref.remove(_keyUserId);
    await _pref.remove(_keysIsLoggedIn);
    await _pref.remove(_keyUserProfileImage);
  }

}