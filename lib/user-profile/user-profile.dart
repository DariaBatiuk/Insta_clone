
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course/user-profile/user-profile.enum.dart';

class UserProfile {
  final String uid;
  final String email;
  final String userName;
  final String avatar;
  final String? bio;
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final int? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? website;

  UserProfile(
   {
     required this.uid,
     required this.email,
     required this.userName,
     required this.avatar,
     this.bio,
     this.firstName,
     this.lastName,
     this.gender,
     this.phoneNumber,
     this.website,
     this.createdAt,
     this.updatedAt,
   });

  factory UserProfile.fromFirebaseUser(User firebaseUser) {
    return UserProfile(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
        userName: firebaseUser.displayName!,
        avatar: firebaseUser.photoURL!,
    );
  }

  //method to update specific fields
  copyWith({
    String? email,
    String? userName,
    String? avatar,
    String? bio,
    String? firstName,
    String? lastName,
    Gender? gender,
    int? phoneNumber,
    String? website,
    DateTime? createdAt,
    DateTime? updatedAt
  }) {
    return UserProfile(
    uid: this.uid,
    email: email ?? this.email,
    userName: userName ?? this.userName,
    avatar: avatar ?? this.avatar,
    bio: bio ?? this.bio,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    gender: gender ?? this.gender,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'avatar': avatar,
      'bio': bio ?? "",
      'firstName': firstName ?? "",
      'lastName': lastName ?? "",
      'gender': gender?.toString(),
      'phoneNumber': phoneNumber,
      'website': website ?? "",
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
}