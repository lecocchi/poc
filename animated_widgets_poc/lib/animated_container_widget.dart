import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            selected = !selected;
          },
        );
      },
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: selected ? 200 : 100,
          height: selected ? 100 : 200,
          color: selected ? Colors.blueGrey : Colors.white,
          alignment: selected ? Alignment.center : Alignment.topCenter,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
