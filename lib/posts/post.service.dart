import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course/posts/post.dart';

class PostService{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

 Stream<List<Post>>getPosts(){
   return 
       _firebaseFirestore
       .collection("posts")
       .orderBy("createdAt", descending: true)
       .snapshots().asyncMap((snapshot) async{
         List<Post> posts = [];

       for(QueryDocumentSnapshot<Map<String, dynamic>> firestorePostDoc in snapshot.docs) {
         DocumentReference userProfileRef = firestorePostDoc["createdBy"];
         DocumentSnapshot firestoreUserProfileDoc = await userProfileRef.get();

         posts.add(Post.fromFirestore(firestorePostDoc, firestoreUserProfileDoc));
       }

         return posts;
       });
 } 
}