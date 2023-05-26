import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage1.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

late String id;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? finalEmail;
  getid() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        id = user.uid;
      }
    });
  }

  @override
  void initState() {
    // getValidation().whenComplete(() async {
    // Timer(
    //   const Duration(seconds: 2),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: ((context) =>
    //           finalEmail == null ? const Login() : const HomePage1()),
    //     ),
    //   ),
    // );
    // });
    getValidation();
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    finalEmail = sharedPreferences.getString('email');
    log(finalEmail.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
        ),
      ),
      home: finalEmail == null ? const Login() : const HomePage1(),
    );
  }
}
