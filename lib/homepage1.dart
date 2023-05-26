// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_1/login.dart';
import 'package:task_1/screen.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({
    super.key,
  });

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.teal[50],
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Kushal Pangeni"),
                accountEmail: Text("kushal@gmail.com"),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: (() async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove("email");
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Login())));
                  }),
                  child: Text("Logout"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Movie App',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: screen[currentindex],
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.teal,
          //  borderRadius: BorderRadius.circular(18)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              onTabChange: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              gap: 8,
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.teal,
              activeColor: Colors.white,
              color: Colors.white,
              tabBackgroundColor: Colors.teal.shade800,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.trending_up,
                  text: 'Favourite',
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'More',
                )
              ]),
        ),
      ),
    );
  }
}
