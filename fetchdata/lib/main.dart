import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shodaimamalistview/ListViewPage.dart';
import 'package:shodaimamalistview/getData.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>getData())
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shodai Mama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => getData(),
        builder: (context,child){
          return ListViewPage();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              ChangeNotifierProvider(
                create: (context) => getData(),
                builder: (context,child){
                  return ListViewPage();
                },
              );
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const ListViewPage()));
            },

            child: const Text('List View'),
          )

      ),
    );
  }
}
