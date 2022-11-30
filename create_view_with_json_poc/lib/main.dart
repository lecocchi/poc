import 'package:create_view_with_json_poc/get_it_config.dart';
import 'package:create_view_with_json_poc/panel_json_view.dart';
import 'package:create_view_with_json_poc/panel_render_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  setUp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Create View With Json POC',
      debugShowCheckedModeBanner: false,
      // home: DragScreen(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autanalabs Render'),
        backgroundColor: const Color.fromARGB(255, 7, 64, 110),
      ),
      body: Row(
        children: const [
          // Flexible(child: PanelJsonView()),
          // Flexible(child: PanelRenderView()),
          PanelJsonView(),
          PanelRenderView()
        ],
      ),
    );
  }
}
