
import 'package:firebase_auth/firebase_auth.dart';

class UserAccountModel {
  final String uid;
  final String email;

  UserAccountModel({
    required this.uid,
    required this.email
  });

  factory UserAccountModel.fromFirebaseUser(User firebaseUser) {
    return UserAccountModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email!);
  }
}