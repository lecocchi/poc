import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: 250,
          color: Colors.blueGrey,
          child: AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50),
          ),
        ),
      ),
    );
  }
}
