// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/homepage1.dart';
import 'package:task_1/reusable_widgets/reusable_widget.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                          text: "Let's start, \n",
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'with ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 84, 84),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      TextSpan(
                          text: 'Registration!',
                          style: TextStyle(
                              // color: Colors.red,
                              color: Color.fromARGB(255, 50, 58, 58),
                              fontWeight: FontWeight.bold,
                              fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //Enter your email and password............
                const Text(
                  "Register your account here",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ),
                //textformfield
                //first and last name
                // Row(
                //   children: [
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                //         child: TextFormField(
                //           style: TextStyle(fontSize: 15),
                //           validator: (values) {
                //             if (values!.isEmpty) {
                //               return "Enter first name";
                //             } else {
                //               return null;
                //             }
                //           },
                //           decoration: InputDecoration(
                //             labelText: 'First name',
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(6)),
                //           ),
                //           keyboardType: TextInputType.name,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                //         child: TextFormField(
                //           style: TextStyle(fontSize: 15),
                //           validator: (values) {
                //             if (values!.isEmpty) {
                //               return "Enter Last name";
                //             } else {
                //               return null;
                //             }
                //           },
                //           decoration: InputDecoration(
                //             labelText: 'Last name',
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(6)),
                //           ),
                //           keyboardType: TextInputType.name,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 15,
                ),
                //email
                foremail("Email", email),
                SizedBox(
                  height: 10,
                ),
                //password
                forpassword("Password", password),
                SizedBox(
                  height: 20,
                ),
                //Login Button
                InkWell(
                  onTap: (() {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then((value) {
                      FirebaseFirestore.instance
                          .collection('User Data')
                          .doc(value.user!.uid)
                          .set({
                        'email': value.user!.email,
                        'id': value.user!.uid
                      });
                      log('Signed Up');
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return HomePage1();
                            // HomePage(
                            //     email: email.text, password: password.text);
                          }),
                        ),
                      );
                    }).onError((error, stackTrace) => log("$error"));
                  }),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: Color.fromARGB(255, 50, 58, 58),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                //Joined us before? Login
                Row(
                  children: [
                    Text(
                      "Joined us before? ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 61, 60), fontSize: 15),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: Text(
                        'Login',
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
