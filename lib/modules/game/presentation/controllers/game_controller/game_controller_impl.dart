import 'package:flutter/cupertino.dart';
import 'package:tiktaktoe/modules/game/domain/services/game_service/game_service.dart';
import 'package:tiktaktoe/modules/game/presentation/controllers/game_controller/game_controller.dart';

class GameControllerImpl extends ChangeNotifier implements GameController {
  GameControllerImpl({required this.gameService});

  GameService gameService;

  String _nameP1 = '';
  String _nameP2 = '';
  int _pointP1 = 0;
  int _pointP2 = 0;

  @override
  String get player1Name => _nameP1;

  @override
  String get player1point => _pointP1.toString();

  @override
  String get player2Name => _nameP2;

  @override
  String get player2point => _pointP2.toString();

  @override
  bool hasWinCondition({
    required List<int> playersFields,
    required bool isPlayer1,
  }) {
    final bool madePoint = gameService.hasWinCondition(
      playersFields: playersFields,
    );

    _addPoints(isPlayer1: isPlayer1, madePoint: madePoint);

    return madePoint;
  }

  void _addPoints({required bool madePoint, required bool isPlayer1}) {
    if (isPlayer1 && madePoint) {
      _pointP1++;
    } else if (!isPlayer1 && madePoint) {
      _pointP2++;
    }

    notifyListeners();
  }

  @override
  void setPlayersName({
    required String player1Name,
    required String player2Name,
  }) {
    _nameP1 = player1Name;
    _nameP2 = player2Name;
    notifyListeners();
  }

  @override
  void resetPoint() {
    _pointP1 = 0;
    _pointP2 = 0;
    notifyListeners();
  }
}
