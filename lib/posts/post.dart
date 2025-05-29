import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course/home/media.dart';

class Post{
  final String userName;
  final String avatar;
  final List <Media> media;
  final String caption;
  final int likes;
  final int shares;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post({
    required this.userName,
    required this.avatar,
    required this.media,
    required this.caption,
    required this.likes,
    required this.shares,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromFirestore(DocumentSnapshot firestorePostDoc, DocumentSnapshot firestoreUserProfileDoc) {
      Map<String, dynamic> firestorePostData = firestorePostDoc.data() as Map<String, dynamic>;
      Map<String, dynamic> firestoreProfileData = firestoreUserProfileDoc.data() as Map<String, dynamic>;

      List<Media> media = (firestorePostData["media"] as List).map((media) => Media.fromMap(media as Map<String, dynamic>)).toList();

      return Post(
          userName: firestoreProfileData["userName"],
          avatar: firestoreProfileData["avatar"],
          media: media,
          caption: firestorePostData["caption"],
          likes: firestorePostData["likes"],
          shares: firestorePostData["shares"],
          comments: firestorePostData["comments"],
          createdAt: (firestorePostData["createdAt"] as Timestamp).toDate(),
          updatedAt: (firestorePostData["updatedAt"] as Timestamp).toDate()
      );
  }
}