import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({
    Key? key,
  }) : super(key: key);

  final List<String> names = [
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
    'Leandro',
    'Julieta',
    'Guada',
    'Santi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.cyan[300],
            width: 300,
            height: MediaQuery.of(context).size.height,
          ),
          Expanded(
            child: Align(
              child: Container(
                color: Colors.blueAccent,
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: names
                        .map((n) => Container(
                              alignment: Alignment.center,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              color: Colors.amber,
                              child: Text(n),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
