// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextFormField forpassword(String labeltext, TextEditingController controller) {
  return TextFormField(
    obscureText: true,
    controller: controller,
    validator: (value) {
      if (value != null && value.length < 7) {
        return "Enter min. 7 characters";
      } else {
        return null;
      }
    },
    style: TextStyle(fontSize: 15),
    decoration: InputDecoration(
      // prefixIcon: icon,
      labelText: labeltext,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

TextFormField foremail(String labeltext, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    validator: (email) {
      if (email != null && !EmailValidator.validate(email)) {
        return "Enter valid email";
      } else {
        return null;
      }
    },
    style: TextStyle(fontSize: 15),
    decoration: InputDecoration(
      // prefixIcon: icon,
      labelText: labeltext,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

void setLoginData(String email, String password) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString("email", email);
  sharedPreferences.setString("password", password);
}

Future getLoginData() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String? email;
  email = sharedPreferences.getString('email');
  sharedPreferences.getString('password');
  return email ?? "Null data";
}
