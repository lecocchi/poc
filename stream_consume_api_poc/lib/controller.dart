import 'dart:async';

import 'package:stream_consume_api_poc/config.dart';
import 'package:stream_consume_api_poc/repository.dart';

import 'post.dart';

class Controller {
  final Repository _repository = getIt.get<Repository>();

  StreamController<List<Post>> data = StreamController<List<Post>>();

  Stream<List<Post>?> fetch() async* {
    yield* Stream.value(null);
    List<Post> posts = await _repository.fetch();
    yield* Stream.value(posts);
  }
}
