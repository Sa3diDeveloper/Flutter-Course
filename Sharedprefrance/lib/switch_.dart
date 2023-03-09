import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  bool isSwitched = false;

  Future<void> storeBoolValue() async {
    final SharedPreferences _pref = await pref;
    final bool? boolValue = await (_pref.setBool('bool', isSwitched));
    setState(() {
      isSwitched ==
          _pref.setBool('bool', isSwitched).then((bool val) {
            return boolValue;
          });
    });
  }

  @override
  void initState() {
    super.initState();
    isSwitched ==
        pref.then((SharedPreferences prefs) {
          return prefs.getBool('bool');
        });
  }

  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(),
      body: Center(
        child: Switch(
            value: isSwitched,
            onChanged: (val) {
              setState(() {
                storeBoolValue();
                isSwitched = val;
                if (isSwitched == true) {
                  color = Colors.black;
                } else {
                  color = Colors.white;
                }
              });
            }),
      ),
    );
  }
}
