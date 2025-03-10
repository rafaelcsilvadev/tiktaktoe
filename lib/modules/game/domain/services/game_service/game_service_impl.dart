import 'package:flutter/foundation.dart';
import 'package:tiktaktoe/modules/game/domain/services/game_service/game_service.dart';

class GameServiceImpl implements GameService {
  List<List<int>> winCondition = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  @override
  bool hasWinCondition({required List<int> playersFields}) {
    final List<int> fields = List.from(playersFields);

    if (fields.length < 3) return false;

    fields.sort((a, b) => a.compareTo(b));
    return winCondition.any((item) => listEquals(item, fields));
  }
}
