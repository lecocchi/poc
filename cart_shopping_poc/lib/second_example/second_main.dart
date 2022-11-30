import 'package:cart_shopping_poc/second_example/father.dart';
import 'package:cart_shopping_poc/second_example/son.dart';
import 'package:flutter/material.dart';

class SecondMain extends StatelessWidget {
  SecondMain({Key? key}) : super(key: key);

  final GlobalKey _keyFather = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SizedBox.expand(
        child: Stack(
          children: [
            Father(
              key: _keyFather,
            ),
            Wrap(
              children: [
                Son(
                  key: GlobalKey(),
                  fatherKey: _keyFather,
                  pathImage: 'assets/trago1.png',
                ),
                Son(
                  key: GlobalKey(),
                  fatherKey: _keyFather,
                  pathImage: 'assets/trago2.png',
                ),
                Son(
                  key: GlobalKey(),
                  fatherKey: _keyFather,
                  pathImage: 'assets/trago3.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
