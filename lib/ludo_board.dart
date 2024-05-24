import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:ludo_flutter/utils/constant.dart';

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
    bool isCenterPosition = centerPosition
        .any((position) => position[0] == row && position[1] == col);

    // player position
    if (row < 6 && col < 6) {
      return Colors.green[300]!;
    } else if (row > 8 && col > 8) {
      return Colors.blue[300]!;
    } else if (row < 6 && col > 8) {
      return Colors.yellow[600]!;
    } else if (row > 8 && col < 6) {
      return Colors.red[300]!;
    }
    // home position
    else if (row>8 && row<14 && col == 7) {
      return Colors.red[300]!;
    } else if (col > 8 && col < 14 && row == 7) {
      return Colors.blue[300]!;
    } else if (row > 0 && row < 6 && col == 7) {
      return Colors.yellow[600]!;
    } else if (col > 0 && col < 6 && row == 7) {
      return Colors.green[300]!;
    }
    // center position
    else if (row == 7 && col == 7) {
      return Colors.white;
    }
    // center position
    else if (isCenterPosition) {
      return Colors.grey;
    }
    // start position
    else if (row == startPosition[0][0] && col == startPosition[0][1]) {
      return Colors.red[300]!;
    } 
    else if (row == startPosition[1][0] && col == startPosition[1][1]) {
      return Colors.green[300]!;
    } 
    else if (row == startPosition[2][0] && col == startPosition[2][1]) {
      return Colors.yellow[600]!;
    } 
    else if (row == startPosition[3][0] && col == startPosition[3][1]) {
      return Colors.blue[300]!;
    } 
    else {
      return Colors.white;
    }
  }

  Widget? _getIcon(int row, int col) {
    bool isHoldPosition = holdPosition
        .any((position) => position[0] == row && position[1] == col);

    // arrow to home
    if (row == 14 && col == 7) {
      return const Icon(Icons.arrow_upward, color: Colors.red);
    } else if (row == 7 && col == 14) {
      return const Icon(Icons.arrow_back, color: Colors.blue);
    } else if (row == 7 && col == 0) {
      return const Icon(Icons.arrow_forward, color: Colors.green);
    } else if (row == 0 && col == 7) {
      return const Icon(Icons.arrow_downward, color: Colors.yellow);
    }
    // center position
    else if ((row == 7 && col == 7)) {
      return const Icon(Icons.home, color: Colors.green);
    }
    // hold position
    else if (isHoldPosition) {
      return const Icon(Icons.star, color: Colors.grey);
    } 
    // start position
    else if (row == startPosition[0][0] && col == startPosition[0][1]) {
      return const Icon(Icons.star, color: Colors.grey);
    } else if (row == startPosition[1][0] && col == startPosition[1][1]) {
      return const Icon(Icons.star, color: Colors.grey);
    } else if (row == startPosition[2][0] && col == startPosition[2][1]) {
      return const Icon(Icons.star, color: Colors.grey);
    } else if (row == startPosition[3][0] && col == startPosition[3][1]) {
      return const Icon(Icons.star, color: Colors.grey);
    } 
    else {
      return null;
    }
  }
}
