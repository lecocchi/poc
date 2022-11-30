import 'package:flutter/material.dart';

import 'component.dart';

class ContainerComponent extends StatefulWidget {
  const ContainerComponent({Key? key}) : super(key: key);

  @override
  State<ContainerComponent> createState() => _ContainerComponentState();
}

class _ContainerComponentState extends State<ContainerComponent> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: Component('Container'),
      feedback: Material(
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.blueGrey,
          child: const Text('Container'),
        ),
      ),
      childWhenDragging: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        child: const Text('Container'),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        child: const Text('Container'),
      ),
    );
  }
}
