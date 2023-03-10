
// // ignore_for_file: file_names

//  import 'package:flutter/material.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:url_launcher/url_launcher.dart';

// class detailsView extends StatelessWidget {
//   final String quote,author;

//   const detailsView({Key? key, required this.quote, required this.author}) : super(key: key);

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Details Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               height: 250.0,
//               width: 250.0,
//               color: Colors.blue,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                  // Text("ID: "+ id,style: const TextStyle(color: Colors.white)),
//                   Text("Author: "+ author,style: const TextStyle(color: Colors.white)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text("Width: "+ width.toString(),style: const TextStyle(color: Colors.white)),
//                       Text("Height: "+ height.toString(),style: const TextStyle(color: Colors.white)),],
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: Linkify(
//                 onOpen: _onOpen,
//                 textScaleFactor: 2,
//                 text: "Photo Url: "+ url,
//               ),
//             ),
//           ],
//         )

//       ),
//     );
//   }
//   Future<void> _onOpen(LinkableElement link) async {
//     if (await canLaunch(link.url)) {
//       await launch(link.url,forceWebView: true);
//     } else {
//       throw 'Could not launch $link';
//     }
//   }
// }

