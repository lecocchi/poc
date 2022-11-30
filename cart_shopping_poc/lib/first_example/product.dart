
import 'package:flutter/material.dart';

import 'cart_controller.dart';

class Product extends StatefulWidget {
  const Product({
    Key? key,
    required this.cartKey,
    required this.number,
  }) : super(key: key);

  final GlobalKey cartKey;
  final int number;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
  Offset offsetCart = const Offset(0, 0);
  Offset offsetProduct = const Offset(0, 0);
  late final AnimationController _controller;

  double initWidth = 0;
  double initHeight = 0;

  final List<Widget> productList = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        CartController().cart.add(Colors.blue);
      } else if (status == AnimationStatus.dismissed) {
        print('Reverse');
      }
    });

    productList.addAll([
      GestureDetector(
        onTap: () {
          _controller.forward();
          productList.removeAt(1);

          productList.add(
            NewProduct(
              key: GlobalKey(),
              controller: _controller,
              cartKey: widget.cartKey,
            ),
          );
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 50,
          height: 50,
          color: Colors.red,
          child: Text(widget.number.toString()),
        ),
      ),
      NewProduct(
        key: GlobalKey(),
        controller: _controller,
        cartKey: widget.cartKey,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productList,
    );
  }
}

class NewProduct extends StatefulWidget {
  const NewProduct({
    Key? key,
    required AnimationController controller,
    required this.cartKey,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final GlobalKey cartKey;

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct>
    with SingleTickerProviderStateMixin {
  Offset offsetCart = const Offset(0, 0);
  Offset offsetProduct = const Offset(0, 0);
  late final AnimationController _reverseController;

  double initWidth = 0;
  double initHeight = 0;

  bool _isForward = true;

  @override
  void initState() {
    super.initState();

    _reverseController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBoxProduct = (widget.key as GlobalKey)
          .currentContext!
          .findRenderObject() as RenderBox;

      final RenderBox renderBoxCart =
          widget.cartKey.currentContext!.findRenderObject() as RenderBox;

      setState(() {
        offsetProduct = renderBoxProduct.localToGlobal(Offset.zero);
        offsetCart = renderBoxCart.localToGlobal(Offset.zero);
      });

      final widthCart = widget.cartKey.currentContext!.size!.width;
      final heigthCart = widget.cartKey.currentContext!.size!.height;

      initWidth = (widthCart - 50) / 2;
      initHeight = (heigthCart - 50) / 2;

      setState(() {
        _isForward = false;
      });

      widget._controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _reverseController.forward();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget._controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _isForward
              ? Offset(
                  widget._controller.value *
                      (offsetCart.dx - offsetProduct.dx + initWidth - 20),
                  widget._controller.value *
                      (offsetCart.dy - offsetProduct.dy + initHeight - 20))
              : const Offset(200, 200),
          // : Offset(
          //     widget._controller.value *
          //         (offsetCart.dx - offsetProduct.dx + initWidth - 20),
          //     widget._controller.value *
          //         (offsetCart.dy - offsetProduct.dy + initHeight - 20)),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 50),
            opacity: 1 - widget._controller.value,
            child: Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              width: 30,
              height: 30,
              color: Colors.blue,
              child: const Text('P'),
            ),
          ),
        );
      },
    );
  }
}
