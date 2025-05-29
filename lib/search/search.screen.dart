import 'package:flutter/material.dart';
import 'package:flutter_course/app.components/app_bottom_navigation_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Text("Search Screen"),
          )),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 1,),
    );
  }
}
