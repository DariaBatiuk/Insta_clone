import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), activeIcon: Icon(Icons.add_box), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), activeIcon: Icon(Icons.video_collection), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), activeIcon: Icon(Icons.person_2), label: "")
        ],
      elevation: 0.0,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: (w) => print(w),
    );
  }
}
