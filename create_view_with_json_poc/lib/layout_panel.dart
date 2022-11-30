import 'package:create_view_with_json_poc/components/container_component.dart';
import 'package:flutter/material.dart';

import 'components/component.dart';

class LayoutPanel extends StatefulWidget {
  const LayoutPanel({Key? key}) : super(key: key);

  @override
  State<LayoutPanel> createState() => _LayoutPanelState();
}

class _LayoutPanelState extends State<LayoutPanel> {
  Widget? child;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<Component>(
      builder: ((context, candidateData, rejectedData) {
        return Container(
          width: 500,
          height: 500,
          color: isHover ? Colors.black12 : Colors.green[100],
          child: Align(
            child: child,
          ),
        );
      }),
      onAccept: (component) {
        setState(() {
          child = validateConponent(component);
          isHover = false;
        });
      },
      onMove: (details) {
        setState(() {
          isHover = true;
        });
      },
      onLeave: (data) {
        setState(() {
          isHover = false;
        });
      },
    );
  }

  Widget validateConponent(Component component) {
    if (component.type == 'Container') {
      return DragTarget<Component>(
        builder: ((context, candidateData, rejectedData) {
          return Container(
            width: 200,
            height: 200,
            color: isHover ? Colors.black12 : Colors.pink[100],
            child: Align(
              child: Container(),
            ),
          );
        }),
        onAccept: (child) {
          setState(() {
            this.child = const ContainerComponent();
            isHover = false;
          });
        },
        onMove: (details) {
          setState(() {
            isHover = true;
          });
        },
        onLeave: (data) {
          setState(() {
            isHover = false;
          });
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
