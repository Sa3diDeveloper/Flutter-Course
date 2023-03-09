// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NewOne extends StatefulWidget {
//   const NewOne({super.key});

//   @override
//   State<NewOne> createState() => _NewOneState();
// }

// class _NewOneState extends State<NewOne> {
//   List items = [1, 2, 3, 4, 5];
// Future<SharedPreferences> prefs = await SharedPreferences.getInstance();
//   late int currentIndex;
//   Future<void> incrwmwnt()async{
// SharedPreferences prefs = await SharedPreferences.getInstance();
//   setState(() {
//          prefs.setInt('listview_index', currentIndex);
//   });
//   }
//   @override
//   void initState() {
      

//  prefs.getInt('listview_index');
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         currentIndex = index;
//         return Text(items[currentIndex]);
//       },
//     ));
//   }
// }
