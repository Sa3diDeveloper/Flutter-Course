import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedprefrance/sharedprefrance/counter/inrement_decrement_pro.dart';

class SherdPrefTry extends StatefulWidget {
  const SherdPrefTry({super.key});

  @override
  State<SherdPrefTry> createState() => _SherdPrefTryState();
}

class _SherdPrefTryState extends State<SherdPrefTry> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 1), () {
      final increment =
          Provider.of<IncrementDecrementProvider>(context, listen: false);
      increment.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final incrementDecrementProvider =
        Provider.of<IncrementDecrementProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          FutureBuilder(
              future: incrementDecrementProvider.counter,
              builder: ((context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Button Pushed Times: ${snapshot.data}"),
                  ],
                );
              })),
          TextButton(
              onPressed: incrementDecrementProvider.increment,
              child: const Text("Increment +")),
          const SizedBox(
            height: 20,
          ),
          // TextButton(
          //     onPressed: incrementDecrementProvider.decrement,
          //     child: const Text("decrement -"))
        ],
      )),
    );
  }
}
