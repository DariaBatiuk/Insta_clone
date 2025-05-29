import 'package:flutter/material.dart';
import 'package:flutter_course/app.components/app_bottom_navigation_bar.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Text("Videos Screen"),
          )),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 3,),
    );
  }
}
