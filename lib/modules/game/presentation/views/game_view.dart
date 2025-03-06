import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';
import 'package:tiktaktoe/modules/game/game_routes.dart';
import 'package:tiktaktoe/modules/game/presentation/components/game_field.dart';
import 'package:tiktaktoe/modules/game/presentation/components/player_points.dart';
import 'package:tiktaktoe/modules/game/presentation/controllers/game_controller/game_controller.dart';
import 'package:tiktaktoe/modules/game/presentation/stores/game_field_store/game_field_store.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  bool isPlayer1 = true;
  List<String> housesValues = [];

  final GameFieldStore _gameFieldStore = Modular.get<GameFieldStore>();
  final GameController _gameController = Modular.get<GameController>();

  @override
  void initState() {
    super.initState();
    _gameController.resetPoint();
  }

  @override
  void dispose() {
    super.dispose();
    Modular.dispose<GameFieldStore>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.primary.value,
      appBar: AppBar(
        backgroundColor: AppColors.primary.value,
        leading: IconButton(
          onPressed: () => Modular.to.popAndPushNamed(GameRoutes.players),
          icon: Icon(Icons.chevron_left, color: AppColors.neutral.value),
        ),
      ),
      body: Column(
        children: [
          Gap(size.height * 0.01),
          AnimatedBuilder(
            animation: _gameController,
            builder: (_, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PlayerPoints(
                    name: _gameController.player1Name,
                    point: _gameController.player1point,
                  ),
                  PlayerPoints(
                    name: _gameController.player2Name,
                    point: _gameController.player2point,
                  ),
                ],
              );
            },
          ),
          Gap(size.height * 0.1),
          Container(
            alignment: Alignment.center,
            child: GameField(
              onHouse: () {
                _gameFieldStore.onChangePlayer();
                _gameController.hasWinCondition(
                  playersFields:
                      isPlayer1
                          ? _gameFieldStore.player1Fields
                          : _gameFieldStore.player2Fields,
                  isPlayer1: isPlayer1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
