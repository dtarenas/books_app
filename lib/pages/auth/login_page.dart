import 'dart:convert';

import 'package:books_app/pages/home_page.dart';
import 'package:books_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  User user = User.Empty();
  void _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user") ?? "");
    user = User.fromJson(userMap);
    print(user.email);
    print(user.name);
  }

  void _showErrorMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      action:
      SnackBarAction(label: "Ok", onPressed: scaffold.hideCurrentSnackBar),
      duration: const Duration(days: 365),
    ));
  }

  void _login() {
    if (_email.text == user.email && _password.text == user.password){
      _saveSession();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage()
          ),
      );
    } else {
      _showErrorMsg("User and password are invalid");
    }
  }

  void _saveSession() async{
    var prefs  = await SharedPreferences.getInstance();
    prefs.setBool("isUserLogged", true);
  }


  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 128,
                height: 128,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text("Log In")),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.amber,
                    backgroundColor: Colors.amber,
                  )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }


}
