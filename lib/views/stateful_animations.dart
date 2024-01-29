import 'dart:math';

import 'package:flutter/material.dart';

class StatefulAnimations extends StatefulWidget {
  const StatefulAnimations({super.key});

  @override
  State<StatefulAnimations> createState() => _StatefulAnimationsState();
}

class _StatefulAnimationsState extends State<StatefulAnimations>
    with TickerProviderStateMixin {
  bool animationStatus = false;
  late AnimationController controller;
  late AnimationController animation;
  // if you don't modify the tween end value
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.red);
  // if you modify the tween end value
  Color targetValue = Colors.green;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    animation =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            'Implicitly animated built-in widgets : AnimatedFoo \n',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              'No AnimationController, no repeat, no discontinuous and only for one single child. You can trigger them in a stateful widget with setState but also in Stream or Future\n',
              textAlign: TextAlign.center),
          const Text('Here we have AnimatedAlign', textAlign: TextAlign.center),
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            alignment:
                animationStatus ? Alignment.centerLeft : Alignment.centerRight,
            child: const Icon(Icons.access_alarm),
          ),
          const Text('Here we have AnimatedDefaultTextStyle',
              textAlign: TextAlign.center),
          TextButton(
            onPressed: () {
              setState(() {
                animationStatus
                    ? animationStatus = false
                    : animationStatus = true;
              });
            },
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 3),
              style:
                  TextStyle(color: animationStatus ? Colors.blue : Colors.red),
              child: const Text("Click me"),
            ),
          ),
          const Text('Here we have AnimatedContainer',
              textAlign: TextAlign.center),
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            color: animationStatus ? Colors.blue : Colors.red,
            width: animationStatus ? 35.0 : 60.0,
            height: animationStatus ? 60.0 : 35.0,
            // Built-in Curves at https://api.flutter.dev/flutter/animation/Curves-class.html
            // curve: Curves.elasticInOut,
            // But you can easily extends the Curve class and create your own
            curve: const SineCurve(),
          ),
          const Text(
              'There is also AnimatedOpacity, AnimatedPadding, AnimatedRotation, AnimatedPhysicalModel, AnimatedPositioned, AnimatedPositionedDirectional, AnimatedSize, AnimatedTheme, AnimatedCrossFade and AnimatedSwitcher \n',
              textAlign: TextAlign.center),
          const Text(
            'Implicitly animated custom widgets : TweenAnimationBuilder \n',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Use TweenAnimationBuilder when there isn't an 'AnimatedFoo' widget already. No setState necessary, but you can set the tween's end parameter to animate to a new value. Note that if you don't modify the tween value while the widget is rendered, it is better to declare it as a Static Final variable",
              textAlign: TextAlign.center),
          TweenAnimationBuilder<Color?>(
            // if you don't modify the tween end value
            tween: colorTween,
            // if you modify the tween end value
            // tween: ColorTween(begin: Colors.white, end: targetValue),
            duration: const Duration(seconds: 3),
            builder: (BuildContext context, Color? value, Widget? child) {
              return GestureDetector(
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                    child: child!),
                onTap: () {
                  setState(() {
                    targetValue = Colors.red;
                  });
                },
              );
            },
            child: const FlutterLogo(
              size: 100.0,
            ),
          ),
          const Text(
            'Explicitly animated built-in widgets : FooTransition \n',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              'Need an AnimationController, can repeat, loop, pause etc \n',
              textAlign: TextAlign.center),
          const Text('Here we have RotationTransition \n',
              textAlign: TextAlign.center),
          Container(
            color: Colors.black,
            child: Center(
              child: RotationTransition(
                turns: controller,
                child: const FlutterLogo(size: 50.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.isAnimating) {
                controller.stop();
                // _controller.reset();
              } else {
                // _controller.repeat();
                // _controller.reverse();
                controller.forward();
              }
            },
            child: const Text('Play/Pause Rotation'),
          ),
          const Text(
              'There is also SizeTransition, FadeTransition, AlignTransition, ScaleTransition, SlideTransition, PositionedTransition, DecoratedBoxTransition, DefaultTextStyleTransition, RelativePositionedTransition and StatusTransitionWidget \n',
              textAlign: TextAlign.center),
          const Text(
            'Explicitly animated custom widgets : AnimatedBuilder & AnimatedWidget \n',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => ClipPath(
              clipper: const BeamClipper(),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: const [
                      Colors.yellow,
                      Colors.transparent,
                    ],
                    stops: [0, animation.value],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
