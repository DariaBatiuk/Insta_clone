import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final String _genericErrorMessage = "An error occurred. Please try again later.";

  Stream<User?> get firebaseUser => _firebaseAuth.authStateChanges();

  Future<AuthServiceResponse<User>>signupWithEmailAndPassword(String email, String password) async {
    try{
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User ? firebaseUser = userCredential.user;
      return AuthServiceResponse(data: firebaseUser);
    } on FirebaseAuthException catch(e){
      print(e);
      final signupErrorMessage = _handleFirebaseAuthException(e);
      return AuthServiceResponse(errorMessage: signupErrorMessage);
    } catch(e){
      return AuthServiceResponse(errorMessage: _genericErrorMessage);
    }
  }

  Future<AuthServiceResponse<User>>loginWithEmailAndPassword(String email, String password) async {
    try{
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      User ? firebaseUser = userCredential.user;
      return AuthServiceResponse(data: firebaseUser);
    } on FirebaseAuthException catch(e){
      final loginErrorMessage = _handleFirebaseAuthException(e);
      return AuthServiceResponse(errorMessage: loginErrorMessage);
    } catch(e){
      print(e);
      return AuthServiceResponse(errorMessage: _genericErrorMessage);
    }
  }

  String _handleFirebaseAuthException(FirebaseAuthException e) {
    switch(e.code){
      case "weak-password":
        return "The password is too weak";
      case "email-already-in-use" :
        return "The account already exists";
      case "invalid-email" :
        return "The email or password is invalid";
      case "wrong-password" :
        return "The email or password is invalid";
      case "invalid-credential" :
        return "The email or password is invalid";
      default:
        return "An error occurred. Please try again later";
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}

class AuthServiceResponse<T> {
  T? data;
  String? errorMessage;

  AuthServiceResponse({this.data, this.errorMessage});
}