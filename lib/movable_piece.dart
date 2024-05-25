import 'package:flutter/material.dart';
import 'package:ludo_flutter/models/piece.dart';

class MovablePiece extends StatelessWidget {
  final int row;
  final int col;
  final Piece piece;
  final VoidCallback onTap;

  const MovablePiece({
    required this.row,
    required this.col,
    required this.piece,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: col * MediaQuery.of(context).size.width / 15,
      top: row * MediaQuery.of(context).size.width / 15,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          child: Icon(
            Icons.incomplete_circle_rounded,
            color: piece.player == 0
                ? Colors.red
                : piece.player == 1
                    ? Colors.green
                    : piece.player == 2
                        ? Colors.yellow
                        : Colors.blue,
          ),
        ),
      ),
    );
  }
}
