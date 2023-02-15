// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class ImageName extends StatelessWidget {
//   const ImageName({super.key, required this.trend});
//   final List trend;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 280,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(14, 5, 0, 14),
//             child: Container(
//               clipBehavior: Clip.antiAlias,
//               height: 160,
//               decoration: BoxDecoration(
//                   color: Colors.amber, borderRadius: BorderRadius.circular(14)),
//               child: Image(
//                 image: NetworkImage(
//                     'https://image.tmdb.org/t/p/w500' + trend[index]),
//               ),
//             ),
//           ),
//           Text(widget.trendmovies[index]['title'] ??
//                   widget.trendmovies[index]['name'],)
//         ],
//       ),
//     );
//   }
// }
