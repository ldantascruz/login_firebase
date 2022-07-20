import 'package:flutter/material.dart';
import 'package:login_firebase/modules/home/home_page.dart';
import 'package:login_firebase/modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFCEC5F)),
        primaryColor: const Color(0xffFCEC5F),
        focusColor: const Color(0xffFCEC5F),
        iconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
        primaryIconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
      ),
    );
  }
}
