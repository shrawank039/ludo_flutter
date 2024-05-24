import 'dart:math';
import 'package:flutter/material.dart';

class DiceWidget extends StatefulWidget {
  final Function(int) onRoll;

  DiceWidget({required this.onRoll});

  @override
  _DiceWidgetState createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random _random = Random();
  int _diceNumber = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  void rollDice() {
    _controller.forward(from: 0.0).then((_) {
      setState(() {
        _diceNumber = _random.nextInt(6) + 1;
      });
      widget.onRoll(_diceNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: rollDice,
      child: Transform.rotate(
        angle: _animation.value * pi * 2,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomPaint(
            painter: DiceFacePainter(_diceNumber),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DiceFacePainter extends CustomPainter {
  final int diceNumber;

  DiceFacePainter(this.diceNumber);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    double dotSize = size.width / 10;
    double dotRadius = dotSize / 2;

    // Calculate positions for dots
    List<Offset> dots = [];

    if (diceNumber % 2 == 1) {
      dots.add(Offset(size.width / 2, size.height / 2)); // center dot
    }

    if (diceNumber > 1) {
      dots.add(Offset(size.width / 4, size.height / 4)); // top-left
      dots.add(Offset(3 * size.width / 4, 3 * size.height / 4)); // bottom-right
    }

    if (diceNumber > 3) {
      dots.add(Offset(3 * size.width / 4, size.height / 4)); // top-right
      dots.add(Offset(size.width / 4, 3 * size.height / 4)); // bottom-left
    }

    if (diceNumber == 6) {
      dots.add(Offset(size.width / 4, size.height / 2)); // middle-left
      dots.add(Offset(3 * size.width / 4, size.height / 2)); // middle-right
    }

    for (var dot in dots) {
      canvas.drawCircle(dot, dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(DiceFacePainter oldDelegate) {
    return oldDelegate.diceNumber != diceNumber;
  }
}
