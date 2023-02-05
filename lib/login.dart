// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/homepage.dart';
import 'package:task_1/reusable_widgets/reusable_widget.dart';
import 'package:task_1/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 80, 35, 10),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //starting text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hey, \n',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Login ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Now',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //Please sign-in............
                const Text(
                  "Please sign-in to your account",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ), //form
                SizedBox(
                  height: 15,
                ),
                //textformfield
                //email
                foremail("Email", email),
                SizedBox(
                  height: 10,
                ),
                //password
                forpassword("Password", password),
                SizedBox(
                  height: 10,
                ),
                //Login Button
                InkWell(
                  onTap: (() {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then((value) {
                      log('logged In');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => HomePage(
                              email: email.text, password: password.text)),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      log("$error");
                    });
                  }),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                //sign-up
                // RichText(
                //   text: const TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'New on our platform ',
                //         style: TextStyle(
                //             color: Color.fromARGB(255, 58, 62, 62), fontSize: 15),
                //       ),
                //       TextSpan(
                //         text: 'Create an new account',
                //         style: TextStyle(color: Colors.red, fontSize: 15),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
                //sign-up Buttons
                Row(
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 61, 60), fontSize: 15),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Signup()),
                          ),
                        );
                      }),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
