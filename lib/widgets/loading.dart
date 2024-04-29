// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyProgressBar extends StatefulWidget {
  Color color;
  int duration;
  MyProgressBar({required this.color, required this.duration, super.key});

  @override
  State<MyProgressBar> createState() => _MyProgressBarState();
}

class _MyProgressBarState extends State<MyProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: ((5 / widget.duration).toInt()).clamp(0, 60)),
    );

    animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final startColor = Color.lerp(widget.color, Colors.white, 0.5);
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [startColor!,widget.color, Colors.black],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return LinearProgressIndicator(
              value: animation.value,
              minHeight: 15,
              backgroundColor: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
