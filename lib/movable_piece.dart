import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_flutter/notifier/piece_notfier.dart';
import 'package:ludo_flutter/utils/constant.dart';

class MovablePiece extends ConsumerWidget {

  int? row;
  int? col;
  final List<List<int>> path;
  Color? color;

   MovablePiece({
     this.row,
     this.col,
     required this.path,
     this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final currentPositionIndex = ref.watch(diceProvider);
    row = path[currentPositionIndex][0];
    col = path[currentPositionIndex][1];

    return Positioned(
      left: col! * MediaQuery.of(context).size.width / 15,
      top: row! * MediaQuery.of(context).size.width / 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        child: Icon(
          Icons.incomplete_circle,
          color: color,
        ),
      ),
    );
  }
}
