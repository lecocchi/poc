import 'package:cart_shopping_poc/third_example/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:widget_rx/widget_rx.dart';

class ThirdMain extends StatefulWidget {
  const ThirdMain({Key? key}) : super(key: key);

  @override
  State<ThirdMain> createState() => _ThirdMainState();
}

class _ThirdMainState extends State<ThirdMain> {
  bool isExpanded = false;
  final GlobalKey _keyPanel2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Panel1(
              keyPanel2: _keyPanel2,
            ),
            const SizedBox(height: 200),
            Panel2(
              key: _keyPanel2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TaskController().addFirstTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Panel1 extends StatefulWidget {
  Panel1({
    Key? key,
    required this.keyPanel2,
  }) : super(key: key);

  final GlobalKey keyPanel2;
  final GlobalKey keyTask = GlobalKey();

  @override
  State<Panel1> createState() => _Panel1State();
}

class _Panel1State extends State<Panel1> with SingleTickerProviderStateMixin {
  int index = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green[200],
      ),
      child: Center(
        child: Wrx<String, void>(
            stream: TaskController().taskInProgress$,
            onSuccess: (task) {
              return Task(
                keyPanel2: widget.keyPanel2,
                key: GlobalKey(),
                title: task,
              );
            }),
      ),
    );
  }
}

class Panel2 extends StatelessWidget {
  const Panel2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      color: Colors.red[200],
      child: Wrx<List<String>, void>(
          stream: TaskController().taskFinished$,
          onSuccess: (tasks) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Align(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      tasks[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

class Task extends StatefulWidget {
  const Task({
    Key? key,
    required this.keyPanel2,
    required this.title,
  }) : super(key: key);

  final GlobalKey keyPanel2;
  final String title;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Offset offsetPanel1 = const Offset(0, 0);
  Offset offsetPanel2 = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderPanel2 =
          widget.keyPanel2.currentContext!.findRenderObject() as RenderBox;
      offsetPanel2 = renderPanel2.localToGlobal(Offset.zero);

      final RenderBox renderPanel1 = (widget.key as GlobalKey)
          .currentContext!
          .findRenderObject() as RenderBox;
      offsetPanel1 = renderPanel1.localToGlobal(Offset.zero);
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        TaskController().addTask();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            _controller.value * (offsetPanel2.dx - offsetPanel1.dx + 170),
            _controller.value * (offsetPanel2.dy - offsetPanel1.dy),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
