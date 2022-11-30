import 'package:flutter/material.dart';

import 'third_example/third_main.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey cartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThirdMain(),
    );
  }
}
