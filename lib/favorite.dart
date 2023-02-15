// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:task_1/main.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$id");

  @override
  void initState() {
    super.initState();
  }
  //add dispose later

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: ((context, snapshot, animation, index) => ListTile(
            leading: Text(snapshot.child("title").value.toString()),
            onTap: () {
              // MovieDetails(moviedetails: moviedetails)
            },
          )),
    );
  }
}
