// ignore_for_file:  sort_constructors_first
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo32 extends StatefulWidget {
  const SharedPreferencesDemo32({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemo32State createState() => SharedPreferencesDemo32State();
}

class SharedPreferencesDemo32State extends State<SharedPreferencesDemo32> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  late Future<int> _counter1;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    final counter1 = await (prefs.getInt('counter1') ?? _counter);
    // final List<String>? items = prefs.getStringList('items');
    // await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
    int sa = await _counter1;

    // _counter1 == _counter1;
    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
      _counter1 =
          prefs.setInt('counter1', counter1 as int).then((bool success) {
        return counter1 as int;
      });

      print(sa);
      //_counter1.then((value) => print(value));
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
    _counter1 = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  counter() async {
    var sa = _counter1.toString();
    return sa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          Text(_counter1.toString()),
                          TextButton(
                              onPressed: () async {
                                _counter1 = _counter;
                                int sa = await _counter1;
                                setState(() {
                                  print(sa);
                                });
                              },
                              child: Text("${_counter1.toInt()}")),
                          Text(
                            'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                            'This should persist across restarts.',
                          ),
                        ],
                      );
                    }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _incrementCounter();
          print("*********");
          int sa = await _counter1;
          print(sa);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

extension FutureIntExtensions on Future<int> {
  Future<int> toInt() {
    return then((value) => value as int);
  }
}
