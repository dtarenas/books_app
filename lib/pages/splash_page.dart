import 'package:books_app/pages/drawer_page.dart';
import 'package:books_app/pages/home_page.dart';
import 'package:books_app/pages/auth/login_page.dart';
import 'package:books_app/pages/navigation_bar_page.dart';
import 'package:books_app/pages/tabs_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png')),
      ),
    );
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 2), () async {
     // var prefs = await SharedPreferences.getInstance();
      //var isUserLogged = prefs.getBool("isUserLogged") ?? false;
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBarPage()));
          //MaterialPageRoute(builder: (context) => const TabsPage()));
          //MaterialPageRoute(builder: (context) => const DrawerPage()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      });
    });
  }
}
