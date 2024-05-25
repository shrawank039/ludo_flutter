import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_flutter/dice.dart';
import 'package:ludo_flutter/ludo_board.dart';
import 'package:ludo_flutter/movable_piece.dart';
import 'package:ludo_flutter/notifiers/dice_notfier.dart';
import 'package:ludo_flutter/notifiers/pieces_notifier.dart';
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
  //int _currentPositionIndex = 1;
  int currentPlayer = 0; // Player = 0, 1, 2, 3

  List paths = [];

  @override
  void initState() {
    super.initState();
    paths = [
      basePath,
      rotatePath(basePath, 15),
      rotatePath(rotatePath(basePath, 15), 15),
      rotatePath(rotatePath(rotatePath(basePath, 15), 15), 15),
    ];
    paths[0].addAll(p1HomePosition);
    paths[1].addAll(p2HomePosition);
    paths[2].addAll(p3HomePosition);
    paths[3].addAll(p4HomePosition);
  }

  void _movePiece(int pieceID, WidgetRef ref) {
    int diceRoll = ref.watch(diceProvider);
    //dev.log('diceRoll: $diceRoll');
    if (pieceID != -1 && diceRoll != 0) {
      ref
          .read(piecesProvider.notifier)
          .movePiece(currentPlayer, pieceID, diceRoll, paths[currentPlayer]);
      // reset dice after move
      ref.read(diceProvider.notifier).updateDice(0);
      // change player
      currentPlayer = (currentPlayer + 1) % 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pieces = ref.watch(piecesProvider);

    return Stack(
      children: [
        const LudoBoard(),
        ...pieces.map((piece) {
          final position = paths[piece.player][piece.positionIndex];
          return MovablePiece(
            row: position[0],
            col: position[1],
            piece: piece,
            onTap: () {
              if (piece.player == currentPlayer) {
                _movePiece(piece.id, ref);
              }
            },
          );
        }).toList(),
        Positioned(
          bottom: 50,
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('Player ${currentPlayer + 1} Turn'),
            DiceWidget(onRoll: (value) {
              ref.read(diceProvider.notifier).updateDice(value);
            }),
          ]),
        ),
      ],
    );
  }
}
