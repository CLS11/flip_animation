import 'package:flip_animation/circle_clipper.dart';
import 'package:flip_animation/components.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  @override
  void initState() {
    super.initState();

    _counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(CurvedAnimation(
        parent: _counterClockwiseRotationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    _counterClockwiseRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseRotationController
      ..reset()
      ..forward.delayed(const Duration(
        seconds: 1,
      ));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _counterClockwiseRotationAnimation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: HalfCircleClipper(side: CircleSide.left),
                    child: Container(
                      color: Colors.blueGrey,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ClipPath(
                    clipper: HalfCircleClipper(side: CircleSide.right),
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}
