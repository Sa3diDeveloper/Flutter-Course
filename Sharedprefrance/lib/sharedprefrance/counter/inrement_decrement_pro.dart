import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncrementDecrementProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  Future<int> counter = Future.value(0);

  Future<void> increment() async {
    SharedPreferences pref = await _pref;
    final int counterPref = (pref.getInt('counter') ?? 0) + 1;
    counter =
        pref.setInt('counter', counterPref).then((value) => counterPref);
    notifyListeners();
  }

  // Future<void> decrement() async {
  //   SharedPreferences prefs = await _prefs;
  //   final int _countrePrefs = (prefs.getInt('counter') ?? 0) - 1;
  //   counter =
  //       prefs.setInt('counter', _countrePrefs).then((value) => _countrePrefs);
  //   notifyListeners();
  // }

  initState() {
    counter = _pref.then((SharedPreferences pref) {
      return pref.getInt('counter') ?? 0;
    });
    notifyListeners();
  }
}
