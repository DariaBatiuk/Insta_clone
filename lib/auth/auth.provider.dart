import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course/auth/auth.service.dart';

class AuthProvider extends ChangeNotifier{
  final AuthService _authService = AuthService();
  String _email = "";

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }
  Future<bool> signupWithEmailAndPassword(String password) async {
    User ? firebaseUser = await _authService.signupWithEmailAndPassword(_email, password);
    print(firebaseUser);
    if(firebaseUser != null) {
      return true;
    }
    return false;
  }
}

