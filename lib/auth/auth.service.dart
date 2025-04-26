import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?>signupWithEmailAndPassword(String email, String password) async {
    try{
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User ? firebaseUser = userCredential.user;
      return firebaseUser;
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print("The password is too weak!");
      } else if(e.code == 'email-already-in-use'){
        print('The account already exists');
      }
      return null;
    } catch(e){
      print(e);
      return null;
    }
  }
}