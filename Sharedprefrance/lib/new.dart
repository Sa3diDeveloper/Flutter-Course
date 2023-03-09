import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;
  String stringValue = "No value";

  @override
  void initState() {
    super.initState();
    getAllSavedData();
    // You can use the initState where you can get all the saved categories and the assign it based on it.
  }

  getAllSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? value = prefs.getBool("youKey");
    if (value != null) stringValue = value.toString();
    setState(() {});
  }

  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Switch(
                value: isSelected,
                onChanged: (val) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("youKey", isSelected);
                  setState(() {
                    isSelected = val;
                    if (isSelected == true) {
                      color = Colors.black;
                    } else {
                      color = Colors.white;
                    }
                  });
                }),

            // This is when you open the screen for second time you get the value as true
            Text('This is the value you saved $stringValue'),
          ],
        ),
      ),
    );
  }
}
