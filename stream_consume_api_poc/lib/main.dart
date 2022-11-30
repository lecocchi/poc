import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stream_consume_api_poc/config.dart';
import 'package:stream_consume_api_poc/controller.dart';

import 'post.dart';
import 'repository.dart';

void main() {
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    _controller.fetch();
  }

  final Controller _controller = getIt.get<Controller>();
  final Repository _repository = getIt.get<Repository>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Consume API POC',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Consume API POC'),
        ),
        body: Center(
          child: StreamBuilder<List<Post>?>(
            stream: _controller.fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data!;

                if (posts.isEmpty) {
                  return Container();
                }

                return Text(posts[Random().nextInt(posts.length)].title);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          // child: FutureBuilder<List<Post>>(
          //   future: _controller.fetch(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<Post> posts = snapshot.data!;

          //       return Text(posts[Random().nextInt(posts.length)].title);
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.fetch();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
