

import 'package:engineering_guru/pages/homepage.dart';
import 'package:engineering_guru/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(800, 800),
      minTextAdapt: true,
      child: const MaterialApp(
        title: "Engineering guru",
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
      ),
    );
  }
}