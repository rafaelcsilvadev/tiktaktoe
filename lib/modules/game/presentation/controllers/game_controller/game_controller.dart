import 'package:flutter/cupertino.dart';

abstract class GameController extends ChangeNotifier {
  String get player1point;
  String get player2point;
  String get player1Name;
  String get player2Name;
  bool hasWinCondition({
    required List<int> playersFields,
    required bool isPlayer1,
  });
  void setPlayersName({
    required String player1Name,
    required String player2Name,
  });
  void resetPoint();
}
