import 'package:authntications/password_validator.dart';
import 'package:authntications/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // onGenerateRoute: (settings) => Routes.generateRoute(settings),
      home: AdvancedForm(),
    );
  }
}
