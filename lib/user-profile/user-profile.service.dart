

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class UserProfileService {
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
}