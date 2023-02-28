import 'package:flutter/material.dart';

class WidgetsAppLIfeCycle extends StatefulWidget {
  @override
  _WidgetsAppLIfeCycleState createState() => _WidgetsAppLIfeCycleState();
}

class _WidgetsAppLIfeCycleState extends State<WidgetsAppLIfeCycle> {
  String title = 'Flutter Home Page';

  void updateTitle() {
    setState(() {
      title = 'New Flutter Home Page';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
//firt lifecycle method that is clled and called before the build method
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print('initState');
    _animationController = AnimationController(vsync: this);
  }

//secound lifecycle method that is clled
//every time this method will be called when a dependency changed
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

//this method will be called when ever the widget configuration chnages 
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO: implement didUpdateWidget
    print('didUpdateWidget');
    if (this.widget.title != oldWidget.title) {
      print('Title has changed');
    }
  }
// called when object is removed from the tree permanetally 
// wehn replacing this widgtes to another
// for example using navigator.pushreplacement 
  @override
  void deactivate() {
    // TODO: implement deactivate
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: widget.onPressed,
              child: Text('DidUpdateWidget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ExampleRoutedPage()),
                );
              },
              child: Text('Dispose'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleRoutedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
