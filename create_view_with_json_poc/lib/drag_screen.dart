import 'package:create_view_with_json_poc/components/container_component.dart';
import 'package:flutter/material.dart';

import 'components/component.dart';
import 'layout_panel.dart';

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  Component? component;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autanalabs'),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: const [
          ComponentPanel(),
          SizedBox(width: 50),
          LayoutPanel(),
        ],
      ),
    );
  }
}

class ComponentPanel extends StatelessWidget {
  const ComponentPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 200,
        height: MediaQuery.of(context).size.height,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [ContainerComponent()],
        ),
      ),
    );
  }
}
