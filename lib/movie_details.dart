// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task_1/model/favorite.dart';

class MovieDetails extends StatefulWidget {
  final Map moviedetails;
  const MovieDetails({super.key, required this.moviedetails});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isfav = false;
  var id = '';
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // id = user!.uid;
      if (user != null) {
        id = user.uid;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.moviedetails['title'] ?? widget.moviedetails['name'],
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: (() async {
                setState(() {
                  isfav = true;
                });
                final favorite = Favorite(
                    id: widget.moviedetails['id'],
                    overview: widget.moviedetails['overview'],
                    posterPath: widget.moviedetails['poster_path'],
                    releaseDate: widget.moviedetails['first_air_date'] ??
                        widget.moviedetails['release_date'],
                    title: widget.moviedetails['title'] ??
                        widget.moviedetails['name'],
                    voteAverage: widget.moviedetails['vote_average'],
                    voteCount: widget.moviedetails['vote_count']);
                DatabaseReference refe = FirebaseDatabase.instance
                    .ref("users/$id/${widget.moviedetails['id']}");
                await refe.set(favorite.toJson());
              }),
              icon: isfav ? Icon(Icons.favorite) : Icon(Icons.favorite_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${widget.moviedetails['poster_path']}'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.moviedetails['overview'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            'Average rating: ${widget.moviedetails['vote_average']}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'Vote Count: ${widget.moviedetails['vote_count']}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'Origin Country: ${widget.moviedetails['origin_country']}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            // 'Released Date: '
            widget.moviedetails['first_air_date'] ??
                widget.moviedetails['release_date'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          )
        ]),
      ),
    );
  }
}
