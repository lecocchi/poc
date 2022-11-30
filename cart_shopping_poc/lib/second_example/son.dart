import 'package:cart_shopping_poc/first_example/cart_controller.dart';
import 'package:flutter/material.dart';

class Son extends StatefulWidget {
  const Son({
    Key? key,
    required this.fatherKey,
    required this.pathImage,
  }) : super(key: key);

  final GlobalKey fatherKey;
  final String pathImage;

  @override
  State<Son> createState() => _SonState();
}

class _SonState extends State<Son> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Offset offsetFather = const Offset(0, 0);
  Offset offsetSon = const Offset(0, 0);
  final _durationForward = const Duration(milliseconds: 500);
  bool _isForward = true;
  double _opacity = 1;
  double initWidth = 0;
  double initHeight = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: _durationForward,
      reverseDuration: const Duration(milliseconds: 10),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _controller.reverse();
          _isForward = false;
          _opacity = 1;
          CartController().cart.add(Colors.blue);
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isForward = true;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBoxFather =
          widget.fatherKey.currentContext!.findRenderObject() as RenderBox;

      final RenderBox renderBoxSon = (widget.key as GlobalKey)
          .currentContext!
          .findRenderObject() as RenderBox;

      setState(() {
        offsetFather = renderBoxFather.localToGlobal(Offset.zero);
        offsetSon = renderBoxSon.localToGlobal(Offset.zero);
      });

      final widthCart = widget.fatherKey.currentContext!.size!.width;
      final heigthCart = widget.fatherKey.currentContext!.size!.height;

      initWidth = (widthCart - 50) / 2;
      initHeight = (heigthCart - 50) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                _controller.value *
                    (offsetFather.dx - offsetSon.dx + initWidth),
                _controller.value *
                    (offsetFather.dy - offsetSon.dy + initHeight),
              ),
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: _isForward ? _durationForward : Duration.zero,
                curve: Curves.easeInExpo,
                child: Image.asset(
                  widget.pathImage,
                  width: 100,
                  height: 100,
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            _controller.forward();
            setState(() {
              _opacity = 0;
            });
          },
          child: Image.asset(
            widget.pathImage,
            width: 100,
            height: 100,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
