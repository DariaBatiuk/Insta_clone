import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course/auth/auth.service.dart';
import 'package:flutter_course/user-profile/user-profile.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user-profile.dart';

class UserProfileProvider extends ChangeNotifier{
  final AuthService _authService = AuthService();
  final UserProfileService _userProfileService = UserProfileService();

  UserProfile? _userProfile;

  late SharedPreferences _sharedPreferences;
  String hasSignUpBeforeStatusKey = 'hasSignedUpBefore';
  String _email = "";
  bool _hasSignedUpBefore = false;
  String? get email => _email;

  UserProfile? get userProfile => _userProfile;
  bool get hasSigneUpBefore => _hasSignedUpBefore;

  UserProfileProvider(){
   _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _loadHasSignedUpBeforeStatus();
  }

  Future<void> setHasSignedUpBefore() async {
    await _sharedPreferences.setBool(hasSignUpBeforeStatusKey, true);
    notifyListeners();
  }

  Future<void>_loadHasSignedUpBeforeStatus() async{
    final bool hasSignedUpBeforeStatus = _sharedPreferences.getBool(hasSignUpBeforeStatusKey) ?? false;
    _hasSignedUpBefore = hasSignedUpBeforeStatus;
    notifyListeners();
  }

  Stream<UserProfile?> get userProfileStream => _authService.firebaseUser.map((firebaseUser) => firebaseUser != null ? UserProfile.fromFirebaseUser(firebaseUser) : null);

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  Future<AuthServiceResponse<UserProfile>> signupWithEmailAndPassword(String password) async {
    final authServiceResponse = await _authService.signupWithEmailAndPassword(_email, password);

    User? firebaseUser = authServiceResponse.data;

    if(firebaseUser != null) {
      String defaultUserName = _userProfileService.generateUserName();
      String avatarName = firebaseUser.email!.substring(0,3);
      String randomAvatar = 'https://ui-avatars.com/api/?background=random&name=$avatarName';
      User? updatedFirebaseUser = await _authService.updateAuthCurrentUser(defaultUserName, randomAvatar);

      setHasSignedUpBefore();
      _userProfile = UserProfile.fromFirebaseUser(updatedFirebaseUser ?? firebaseUser);
      await _userProfileService.createUserProfile(_userProfile!);
      return AuthServiceResponse(data: _userProfile);
    }
    return AuthServiceResponse(errorMessage: authServiceResponse.errorMessage);
  }
  Future<AuthServiceResponse<UserProfile>> loginWithEmailAndPassword(String email, String password) async {
    final authServiceResponse = await _authService.loginWithEmailAndPassword(email, password);

    User? firebaseUser = authServiceResponse.data;

    if(firebaseUser != null) {
      _userProfile = UserProfile.fromFirebaseUser(firebaseUser);
      return AuthServiceResponse(data: _userProfile);
    }
    return AuthServiceResponse(errorMessage: authServiceResponse?.errorMessage);
  }
}

// class AuthResponse{
//   bool? success = false;
//   String? errorMessage;
//
//   AuthResponse({this.success = false, this.errorMessage});
// }

