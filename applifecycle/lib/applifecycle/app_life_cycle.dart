import 'package:flutter/material.dart';

class AppLifeCycleManager extends StatefulWidget {
  const AppLifeCycleManager({super.key, required this.child});

  final Widget child;

  @override
  _AppLifeCycleManagerState createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  //  print('AppLifecycleState: $state');
    if (state == AppLifecycleState.paused) {
      print("AppLifecycleState: paused");
    }
      if (state == AppLifecycleState.detached) {
      print("AppLifecycleState: detached");
    } if (state == AppLifecycleState.inactive) {
      print("AppLifecycleState: inactive");
    }
     if (state == AppLifecycleState.resumed) {
      print("AppLifecycleState: resumed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
