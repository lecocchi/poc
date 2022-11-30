import 'dart:async';

import 'package:flutter/painting.dart';

class CartController {
  static final CartController _singleton = CartController._();

  factory CartController() {
    return _singleton;
  }

  CartController._();

  final StreamController<Color> _controller =
      StreamController<Color>.broadcast();

  Stream<Color> get cart$ => _controller.stream;
  Sink<Color> get cart => _controller.sink;
}
