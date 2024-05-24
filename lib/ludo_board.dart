import 'package:flutter/material.dart';
import 'dart:developer';

class LudoBoard extends StatelessWidget {
  final int boardSize = 15;

  const LudoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: boardSize,
      ),
      itemBuilder: (context, index) {
        int row = index ~/ boardSize;
        int col = index % boardSize;
       // log('row $row col $col index $index');
        return Container(
          margin: const EdgeInsets.all(1.0),
          color: _getColor(row, col),
          child: _getIcon(row, col),
        );
      },
      itemCount: boardSize * boardSize,
    );
  }

  Color _getColor(int row, int col) {
    // Define the colors for each part of the board
    if ((row < 6 && col < 6) || (row > 8 && col > 8)) {
      return Colors.green[200]!;
    } else if ((row < 6 && col > 8) || (row > 8 && col < 6)) {
      return Colors.red[200]!;
    } else if ((row == 7 || col == 7) && (row != col)) {
      return Colors.blue[200]!;
    } else if (row == col) {
      return Colors.yellow[200]!;
    } else {
      return Colors.white;
    }
  }

  Widget? _getIcon(int row, int col) {
    if ((row == 1 && col == 1) || (row == 13 && col == 13)) {
      return const Icon(Icons.start, color: Colors.red);
    } else if ((row == 1 && col == 13) || (row == 13 && col == 1)) {
      return const Icon(Icons.start, color: Colors.blue);
    } else if ((row == 7 && col == 7)) {
      return const Icon(Icons.home, color: Colors.green);
    } else {
      return null;
    }
  }
}
