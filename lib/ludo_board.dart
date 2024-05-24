import 'dart:math';

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
    final centerPosition = [
      [6, 6],
      [6, 7],
      [6, 8],
      [7, 6],
      [7, 7],
      [7, 8],
      [8, 6],
      [8, 7],
      [8, 8],
    ];

    bool isCenterPosition = centerPosition
        .any((position) => position[0] == row && position[1] == col);

    if (row < 6 && col < 6) {
      return Colors.green[300]!;
    } else if (row > 8 && col > 8) {
      return Colors.blue[300]!;
    } else if (row < 6 && col > 8) {
      return Colors.yellow[600]!;
    } else if (row > 8 && col < 6) {
      return Colors.red[300]!;
    } else if (row == 7 && col == 7) {
      return Colors.white;
    } else if (isCenterPosition) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Widget? _getIcon(int row, int col) {
    final holdPosition = [
      [2, 6],
      [8, 2],
      [12, 8],
      [6, 12],
    ];

    bool isHoldPosition = holdPosition
        .any((position) => position[0] == row && position[1] == col);

    if (row == 14 && col == 7) {
      return const Icon(Icons.arrow_upward, color: Colors.red);
    } else if (row == 7 && col == 14) {
      return const Icon(Icons.arrow_back, color: Colors.blue);
    } else if (row == 7 && col == 0) {
      return const Icon(Icons.arrow_forward, color: Colors.green);
    } else if (row == 0 && col == 7) {
      return const Icon(Icons.arrow_downward, color: Colors.yellow);
    } else if ((row == 7 && col == 7)) {
      return const Icon(Icons.home, color: Colors.green);
    } else if (isHoldPosition) {
      return const Icon(Icons.star, color: Colors.grey);
    } else {
      return null;
    }
  }
}
