import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course/auth/auth.service.dart';
import 'package:flutter_course/user-account/user-account.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  final AuthService _authService = AuthService();

  UserAccountModel? _userAccount;

  late SharedPreferences _sharedPreferences;
  String hasSignUpBeforeStatusKey = 'hasSignedUpBefore';
  String _email = "";
  bool _hasSignedUpBefore = false;

  UserAccountModel? get userAccount => _userAccount;
  bool get hasSigneUpBefore => _hasSignedUpBefore;

  AuthProvider(){
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

  Stream<UserAccountModel?> get userAccountStream => _authService.firebaseUser.map((firebaseUser) => firebaseUser != null ? UserAccountModel.fromFirebaseUser(firebaseUser) : null);

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  Future<AuthServiceResponse<UserAccountModel>> signupWithEmailAndPassword(String password) async {
    final authServiceResponse = await _authService.signupWithEmailAndPassword(_email, password);

    User? firebaseUser = authServiceResponse.data;

    if(firebaseUser != null) {
      setHasSignedUpBefore();
      _userAccount = UserAccountModel.fromFirebaseUser(firebaseUser);
      return AuthServiceResponse(data: _userAccount);
    }
    return AuthServiceResponse(errorMessage: authServiceResponse.errorMessage);
  }
  Future<AuthServiceResponse<UserAccountModel>> loginWithEmailAndPassword(String email, String password) async {
    final authServiceResponse = await _authService.loginWithEmailAndPassword(email, password);

    User? firebaseUser = authServiceResponse.data;

    if(firebaseUser != null) {
      _userAccount = UserAccountModel.fromFirebaseUser(firebaseUser);
      return AuthServiceResponse(data: _userAccount);
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

