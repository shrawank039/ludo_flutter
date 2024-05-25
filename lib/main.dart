import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_flutter/dice.dart';
import 'package:ludo_flutter/ludo_board.dart';
import 'package:ludo_flutter/movable_piece.dart';
import 'package:ludo_flutter/notifier/piece_notfier.dart';
import 'package:ludo_flutter/utils/constant.dart';
import 'package:ludo_flutter/utils/functions.dart';
import 'dart:developer' as dev;

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        body: GameScreen(),
      ),
    );
  }
}

class GameScreen extends ConsumerStatefulWidget {
  GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  int _currentPositionIndex = 1;
  int boardSize = 15; // a 15x15 board
  int currentPlayer = 0; // Player = 0, 1, 2, 3

  final paths = [];

  @override
  void initState() {
    List<List<int>> pathP1 = basePath; // Base path for player 1
    List<List<int>> pathP2 =
        rotatePath(basePath, boardSize); // Path for player 2
    List<List<int>> pathP3 = rotatePath(pathP2, boardSize); // Path for player 3
    List<List<int>> pathP4 = rotatePath(pathP3, boardSize); // Path for player 4
    pathP1.addAll(p1HomePosition);
    pathP2.addAll(p2HomePosition);
    pathP3.addAll(p3HomePosition);
    pathP4.addAll(p4HomePosition);
    paths.addAll([pathP1, pathP2, pathP3, pathP4]);
    super.initState();
  }

  void _movePiece(int diceRoll, WidgetRef ref) {
    int pathLength = paths[currentPlayer].length;
    bool validMove = (_currentPositionIndex + diceRoll) < pathLength;
    if (validMove) {
      _currentPositionIndex = _currentPositionIndex + diceRoll;
      ref.read(diceProvider.notifier).updatePosition(_currentPositionIndex);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LudoBoard(),
        MovablePiece(path: paths[currentPlayer], color: Colors.red),
        Positioned(
          bottom: 50,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
              child:
                  DiceWidget(onRoll: (diceRoll) => _movePiece(diceRoll, ref))),
        ),
      ],
    );
  }
}
