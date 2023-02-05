import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/login.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;
  const HomePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.orange,
                    Colors.white,
                    Colors.deepPurple
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email: $email",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "Password: $password",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    log('logged out');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Login())));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    child: const Center(child: Text("Log Out")),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
