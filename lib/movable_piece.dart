import 'package:flutter/material.dart';

class MovablePiece extends StatelessWidget {
  final int row;
  final int col;
  final Color color;

  const MovablePiece({
    required this.row,
    required this.col,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: col * MediaQuery.of(context).size.width / 15,
      top: row * MediaQuery.of(context).size.width / 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        child: Icon(
          Icons.star,
          color: color,
        ),
      ),
    );
  }
}
