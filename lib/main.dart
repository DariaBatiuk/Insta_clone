import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/app_theme_data.dart';
import 'package:flutter_course/user-profile/user-profile.provider.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const InstagramClone());
}
class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<UserProfileProvider>(
      create: (_) => UserProfileProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "InstagramClone",
          theme: AppThemeData().light(),
          darkTheme: AppThemeData().dark(),
          themeMode: ThemeMode.light,
          home: AppRoutes.entryScreen,
          routes: AppRoutes.getRoutes(),
      ),
    );
  }
}

