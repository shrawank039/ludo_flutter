import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_flutter/dice.dart';
import 'package:ludo_flutter/ludo_board.dart';
import 'package:ludo_flutter/movable_piece.dart';
import 'package:ludo_flutter/notifier/piece_notfier.dart';
import 'package:ludo_flutter/utils/constant.dart';

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

class GameScreen extends ConsumerWidget {
  
  GameScreen({super.key});

  int _currentPositionIndex = 0;

  void _movePiece(int diceRoll, WidgetRef ref) {
    _currentPositionIndex = (_currentPositionIndex + diceRoll) % path.length;
    ref.read(diceProvider.notifier).updatePosition(_currentPositionIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(
      children: [
        const LudoBoard(),
        MovablePiece(color: Colors.red),
        Positioned(
          bottom: 50,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: DiceWidget(onRoll: (diceRoll) => _movePiece(diceRoll, ref))),
        ),
      ],
    );
  }
}
