import 'package:flutter/material.dart';
import 'package:ludo_flutter/dice.dart';
import 'package:ludo_flutter/ludo_board.dart';
import 'package:ludo_flutter/movable_piece.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ludo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
          child: Dice(onRoll: _movePiece),
        ),
      ],
    );
  }
}
