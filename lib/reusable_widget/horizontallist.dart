// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_1/movie_details.dart';

class HorizontalList extends StatefulWidget {
  final List trendmovies;
  const HorizontalList({super.key, required this.trendmovies});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.trendmovies.length,
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MovieDetails(
                          moviedetails: widget.trendmovies[index],
                        )),
                  ),
                );
              },
              child: SizedBox(
                // color: index / 2 == 0 ? Colors.amber : Colors.teal,
                height: 285,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 180,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(14)),
                        child: Image(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${widget.trendmovies[index]['poster_path']}')
                            // ??
                            // AssetImage("images/movie.png"),
                            ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.trendmovies[index]['title'] ??
                            widget.trendmovies[index]['name'] ??
                            "Loading...",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
