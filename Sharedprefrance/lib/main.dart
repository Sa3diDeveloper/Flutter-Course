import 'package:flutter/material.dart';
import 'package:sharedprefrance/new.dart';

import 'package:sharedprefrance/shared.dart';
import 'package:sharedprefrance/sharedpreferance.dart';
import 'package:sharedprefrance/switch_.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
 
  runApp( const MyApp()

//   runApp( MultiProvider(providers: [
//  ChangeNotifierProvider(create: (_)=>IncrementDecrementProvider(),

//     ),

//   ],
//   child: MyApp21(),
//   ));
      );
}

class MyApp extends StatelessWidget {
const MyApp({super.key, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  MyHomePage(),
    );
  }
}
