import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_1/homepage1.dart';
import 'package:task_1/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidation().whenComplete(() async {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) =>
                finalEmail == null ? const Login() : const HomePage1()),
          ),
        ),
      );
    });
    super.initState();
  }

  String? finalEmail;
  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    finalEmail = sharedPreferences.getString('email');
    log(finalEmail.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.home,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
