import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  final Function(int) onRoll;

  const Dice({super.key, required this.onRoll});

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int _currentRoll = 1;

  void _rollDice() {
    setState(() {
      _currentRoll = Random().nextInt(6) + 1;
      widget.onRoll(_currentRoll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_currentRoll',
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _rollDice,
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
