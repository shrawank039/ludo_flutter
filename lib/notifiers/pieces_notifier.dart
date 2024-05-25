import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_flutter/models/piece.dart';

class PiecesNotifier extends StateNotifier<List<Piece>> {
  PiecesNotifier()
      : super([
          // Initialize pieces for each player
          Piece(0, 1, 0), Piece(0, 1, 1), Piece(0, 1, 2), Piece(0, 1, 3),
          Piece(1, 1, 0), Piece(1, 1, 1), Piece(1, 1, 2), Piece(1, 1, 3),
          Piece(2, 1, 0), Piece(2, 1, 1), Piece(2, 1, 2), Piece(2, 1, 3),
          Piece(3, 1, 0), Piece(3, 1, 1), Piece(3, 1, 2), Piece(3, 1, 3),
        ]);

  void movePiece(int player, int pieceId, int diceRoll, List<List<int>> path) {
    state = state.map((piece) {
      if (piece.player == player && piece.id == pieceId) {
        final newPositionIndex = (piece.positionIndex + diceRoll) % path.length;
        return Piece(player, newPositionIndex, piece.id);
      }
      return piece;
    }).toList();
  }
}

final piecesProvider =
    StateNotifierProvider<PiecesNotifier, List<Piece>>((ref) {
  return PiecesNotifier();
});
