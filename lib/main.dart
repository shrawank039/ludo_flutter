import 'package:flutter/material.dart';
import 'package:ludo_flutter/3d_dice.dart';
import 'package:ludo_flutter/dice.dart';
import 'package:ludo_flutter/ludo_board.dart';
import 'package:ludo_flutter/movable_piece.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ludo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Ludo Flutter')),
        body: const GameScreen(),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  final List<List<int>> path = [
    [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], // left top
    [5, 6], [4, 6], [3, 6], [2, 6], [1, 6], [0, 6], // up left
    [0,7], // top middle
    [0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], // up right
    [6, 9], [6, 10], [6, 11], [6, 12], [6, 13], [6, 14], // right top
    [7, 14], // right middle
    [8, 14], [8, 13], [8, 12], [8, 11], [8, 10], [8, 9], // right bottom
    [9, 8], [10, 8], [11, 8], [12, 8], [13, 8], [14, 8], // bottom right
    [14, 7], // top middle
    [14, 6], [13, 6], [12, 6], [11, 6], [10, 6], [9, 6], // bottom left
    [8, 5], [8, 4], [8, 3], [8, 2], [8, 1], [8, 0], // left bottom
    [7, 0], // left middle
  ];

  int _currentPositionIndex = 1;

  void _movePiece(int diceRoll) {
    setState(() {
      _currentPositionIndex = (_currentPositionIndex + diceRoll) % path.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final position = path[_currentPositionIndex];

    return Stack(
      children: [
        const LudoBoard(),
        MovablePiece(row: position[0], col: position[1], color: Colors.red),
        Positioned(
          bottom: 50,
          left: 50,
          child: DiceWidget(onRoll: _movePiece),
          //Dice(onRoll: _movePiece),
        ),
      ],
    );
  }
}
