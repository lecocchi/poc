import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(_validateEmail);
  Sink<String> get email => _email.sink;

  Stream<String> get password$ => _password.stream.transform(_validatePassword);
  Sink<String> get password => _password.sink;

  final StreamTransformer<String, String> _validateEmail =
      StreamTransformer.fromHandlers(
    handleData: (value, sink) {
      if (!value.contains('@')) {
        sink.addError('Email invalid');
      } else {
        sink.add(value);
      }
    },
  );

  final StreamTransformer<String, String> _validatePassword =
      StreamTransformer.fromHandlers(
    handleData: (value, sink) {
      if (value.length < 2) {
        sink.addError('Password shold be more for 2');
      } else {
        sink.add(value);
      }
    },
  );

  Stream<bool> isVaildForm() async* {
    yield* Rx.combineLatest([email$, password$], (values) => true);
  }
}
