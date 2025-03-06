import 'package:flutter/cupertino.dart';
import 'package:tiktaktoe/modules/game/domain/services/game_service/game_service.dart';
import 'package:tiktaktoe/modules/game/presentation/controllers/game_controller/game_controller.dart';

class GameControllerImpl extends ChangeNotifier implements GameController {
  GameControllerImpl({required this.gameService});

  GameService gameService;

  String nameP1 = '';
  String nameP2 = '';
  int pointP1 = 0;
  int pointP2 = 0;

  @override
  String get player1Name => nameP1;

  @override
  String get player1point => nameP2;

  @override
  String get player2Name => pointP1.toString();

  @override
  String get player2point => pointP2.toString();

  @override
  bool hasWinCondition({
    required List<int> playersFields,
    required bool isPlayer1,
  }) {
    final bool madePoint = gameService.hasWinCondition(
      playersFields: playersFields,
    );

    if (isPlayer1 && madePoint) {
      pointP1++;
    } else if (!isPlayer1 && madePoint) {
      pointP2++;
    }

    notifyListeners();

    return madePoint;
  }

  @override
  void setPlayersName({
    required String player1Name,
    required String player2Name,
  }) {
    nameP1 = player1Name;
    nameP2 = player2Name;
    notifyListeners();
  }
}
