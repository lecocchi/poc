import 'package:flutter/material.dart';
import 'package:widget_rx/widget_rx.dart';

import 'cart_controller.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
    required this.cartKey,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> cartKey;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));

    _animation = Tween<double>(begin: 5, end: -5).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrx<Color, void>(
        stream: CartController().cart$,
        initialData: Colors.green,
        onSuccess: (color) {
          if (color == Colors.blue) {
            _controller.forward();
          }

          return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: Container(
                    key: widget.cartKey,
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                );
              });
        });
  }
}
