import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceNotifier extends StateNotifier<int> {
  DiceNotifier() : super(1);

  void updatePosition(int diceRoll) {
    state = diceRoll;
  }
}

final diceProvider = StateNotifierProvider<DiceNotifier, int>((ref) {
  return DiceNotifier();
});
