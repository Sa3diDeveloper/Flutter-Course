import 'package:authntications/login-sigup-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LogInAndSignInWithEnumExample':
        return MaterialPageRoute(
            builder: (_) => LogInAndSignInWithEnumExample());

      default:
        return MaterialPageRoute(
            builder: (_) => LogInAndSignInWithEnumExample());
    }
  }
}
