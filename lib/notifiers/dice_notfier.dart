import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceNotifier extends StateNotifier<int> {
  DiceNotifier() : super(0);

  void updateDice(int diceRoll) {
    state = diceRoll;
  }
}

final diceProvider = StateNotifierProvider<DiceNotifier, int>((ref) {
  return DiceNotifier();
});
