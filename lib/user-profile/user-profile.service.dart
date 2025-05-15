

import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_course/user-profile/user-profile.dart';

class UserProfileService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  // Create function
  String generateUserName() {
    //Generate cryptographycally strong random number;
    Random _random = Random.secure();

    //Create a string of random characters
    String randomString = base64Url.encode(
        List<int>.generate(16, (_) => _random.nextInt(256)));

    //Create a hash of the randomString using SHA-256
    List<int> bytes = utf8.encode(randomString);
    Digest digest = sha256.convert(bytes);

    String shortHash = digest.toString().substring(0,8);
    return 'user _$shortHash';
  }
  Future <bool> createUserProfile(UserProfile userProfileData) async {
    print('userProfileData: $userProfileData');
    print(userProfileData.toMap());
    try {
      await _firebaseFirestore.collection('user-profiles').doc(userProfileData.uid).set(userProfileData.toMap());
      return true;
    } catch(error) {
return false;
    }
  }
}