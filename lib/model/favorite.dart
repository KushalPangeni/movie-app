// // To parse this JSON data, do
// //
// //     final favorite = favoriteFromJson(jsonString);

import 'dart:convert';

Map<String, Favorite> favoriteFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Favorite>(k, Favorite.fromJson(v)));

String favoriteToJson(Map<String, Favorite> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Favorite {
  Favorite({
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.title,
    required this.voteCount,
    required this.posterPath,
    // required this.isfavorite,
  });

  String overview;
  String releaseDate;
  double voteAverage;
  int id;
  String title;
  int voteCount;
  String posterPath;
  // bool isfavorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        overview: json["overview"],
        releaseDate: json["releaseDate"],
        voteAverage: json["vote_average"]?.toDouble(),
        id: json["id"],
        title: json["title"],
        voteCount: json["vote_count"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "overview": overview,
        "release_date": releaseDate,
        "vote_average": voteAverage,
        "id": id,
        "title": title,
        "vote_count": voteCount,
        "poster_path": posterPath,
      };
}
//-------------------------------------------------
// class Favoritelist {
//   String mainid;
//   Favorite fav;
//   Favoritelist({required this.mainid, required this.fav});
//   Map<String, dynamic> toJson() => {"mainid": mainid, "fav": fav.toJson()};
// }

// class Favorite {
//   int id;
//   String title;
//   String overview;
//   String posterpath;
//   String releasedate;
//   double voteaverage;
//   int votecount;

//   Favorite(
//       {required this.id,
//       required this.title,
//       required this.overview,
//       required this.posterpath,
//       required this.releasedate,
//       required this.voteaverage,
//       required this.votecount});

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "overview": overview,
//         "poster_path": posterpath,
//         "release_date": releasedate,
//         "vote_average": voteaverage,
//         "vote_count": votecount
//       };
//   factory Favorite.fromJson(Map<String, dynamic> json) {
//     return Favorite(
//         id: json['id'],
//         title: json['title'],
//         overview: json['overview'],
//         posterpath: json['posterpath'],
//         releasedate: json['releasedate'],
//         voteaverage: json['voteaverage'],
//         votecount: json['votecount']);
  // }
  // Future createUser(Favorite fav) {
  //   final docUser = FirebaseFirestore.instance.collection('User Data').doc();

  // }
// }
