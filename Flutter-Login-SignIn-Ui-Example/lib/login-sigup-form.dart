// ignore_for_file: avoid_print, unrelated_type_equality_checks, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInAndSignInWithEnumExample extends StatefulWidget {
  const LogInAndSignInWithEnumExample({Key? key}) : super(key: key);

  @override
  _LogInAndSignInWithEnumExampleState createState() =>
      _LogInAndSignInWithEnumExampleState();
}

enum AuthMode { SignUp, LogIn }

class _LogInAndSignInWithEnumExampleState
    extends State<LogInAndSignInWithEnumExample> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  AuthMode _authMode1 = AuthMode.LogIn;

  void _switchMode() {
    if (_authMode1 == AuthMode.LogIn) {
      setState(() {
        _authMode1 = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode1 = AuthMode.LogIn;
      });
    }
  }

  final Map<String, String> _authData = {
    'email': 'roman@gmail.com',
    'password': 'saadi@aaa',
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/webL.png",
                  width: 180,
                  height: 180,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onSaved: (val) {
                    _authData['email'] = val!;
                    print(_authData['email']);
                  },
                  validator: (val) {
                    if (val == null ||
                        val == val.isEmpty ||
                        !val.contains("@")) {
                      return "Your E-mail Not Vaild";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onSaved: (val) {
                    _authData['password'] = val!;
                    print(_authData['password']);
                  },
                  validator: (val) {
                    if (val == null || val == val.isEmpty || val.length <= 8) {
                      return "Your password its not valid";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                if (_authMode1 == AuthMode.SignUp)
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onSaved: (val) {
                      _authData['paasord'] = val!;
                      print(_authData['password']);
                    },
                    validator: (val) {
                      if (_passwordController.text != val) {
                        return "Your password not match";
                      } else {
                        return null;
                      }
                    },
                  ),
                CupertinoButton(
                    color: Colors.blue,
                    child: Text(
                        _authMode1 == AuthMode.LogIn ? "Login" : "Sign up"),
                    onPressed: _submit),
                TextButton(
                    onPressed: _switchMode,
                    child: Text(
                        '${_authMode1 == AuthMode.LogIn ? 'Sign up' : 'logIn'} instead'))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _submit() {
    if (_passwordController == _authData['password']) {}
    if (_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
