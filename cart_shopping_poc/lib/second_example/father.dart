import 'package:flutter/material.dart';
import 'package:widget_rx/widget_rx.dart';

import '../first_example/cart_controller.dart';

class Father extends StatefulWidget {
  const Father({Key? key}) : super(key: key);

  @override
  State<Father> createState() => _FatherState();
}

class _FatherState extends State<Father> with SingleTickerProviderStateMixin {
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
    return Positioned(
      left: 10,
      bottom: 10,
      child: Wrx<Color, void>(
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
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/cart.png'),
                    ),
                  );
                });
          }),
    );
  }
}
