import 'package:flutter/material.dart';

import 'cart.dart';
import 'product.dart';

class FirstMain extends StatelessWidget {
  const FirstMain({
    Key? key,
    required this.cartKey,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> cartKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(left: 100, top: 100, child: Cart(cartKey: cartKey)),
        Center(
          child: Wrap(
            children: List.generate(8, ((index) {
              return Product(
                key: GlobalKey(),
                cartKey: cartKey,
                number: index,
              );
            })),
          ),
        )
      ],
    );
  }
}