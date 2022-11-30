import 'dart:async';

class TaskController {
  static final TaskController _singleton = TaskController._();
  int numTask = 0;
  List<String> tasksFinished = [];

  factory TaskController() {
    return _singleton;
  }

  TaskController._();

  final StreamController<List<String>> _controllerTaskFinished =
      StreamController<List<String>>.broadcast();

  final StreamController<String> _controllerTaskInProgress =
      StreamController<String>.broadcast();

  Stream<List<String>> get taskFinished$ => _controllerTaskFinished.stream;
  Sink<List<String>> get taskFinished => _controllerTaskFinished.sink;

  Stream<String> get taskInProgress$ => _controllerTaskInProgress.stream;
  Sink<String> get taskInProgress => _controllerTaskInProgress.sink;

  void addTask() {
    tasksFinished.add('Task ${numTask.toString()}');
    taskFinished.add(tasksFinished);
    numTask++;
    taskInProgress.add('Task ${numTask.toString()}');
  }

  void addFirstTask() {
    taskInProgress.add('Task ${numTask.toString()}');
  }
}
