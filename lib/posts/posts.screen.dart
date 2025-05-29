import 'package:flutter/material.dart';
import 'package:flutter_course/app.components/app_bottom_navigation_bar.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Text("Posts Screen"),
          )),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 2,),
    );
  }
}
