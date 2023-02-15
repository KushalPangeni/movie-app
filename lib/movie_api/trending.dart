// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_1/reusable_widget/horizontallist.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List trendingmovies = [];
  List topratedmovies = [];
  List topUpcoming = [];
  List videos = [];
  int no = 0;
  final String apiKey = '7829a96f32da10d2a6b44b5e57f1cf62';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODI5YTk2ZjMyZGExMGQyYTZiNDRiNWU1N2YxY2Y2MiIsInN1YiI6IjYzZTA5MDEzOTk3NGVlMGI4NTM4OWUwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eRkr_wo7TiYA5OmujJWiHEmi9xZAKYBxzl9iYdz03xo';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdb = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trending = await tmdb.v3.trending.getTrending();

    Map toprated = await tmdb.v3.movies.getTopRated();
    Map top = await tmdb.v3.movies.getNowPlaying();
    // Map video = await tmdb.v3.movies.get

    setState(() {
      trendingmovies = trending['results'];
      topratedmovies = toprated['results'];
      topUpcoming = top['results'];
      // no = trending.length;
    });
    // log(
    //   trendingmovies.toString(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 12.0),
            child: Text(
              'Trending Movies',
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
          ),
          HorizontalList(trendmovies: trendingmovies),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 12.0),
            child: Text(
              'Top Upcoming Movies',
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
          ),
          HorizontalList(trendmovies: topUpcoming),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 12.0),
            child: Text(
              'Top Rated Movies',
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
          ),
          HorizontalList(trendmovies: topratedmovies),
        ],
      ),
    );
  }
}
