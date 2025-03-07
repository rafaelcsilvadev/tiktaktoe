import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/components/app_button/app_button.dart';
import 'package:tiktaktoe/core/components/app_dialog/app_dialog.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
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
  List<String> housesValues = [];

  final GameFieldStore _gameFieldStore = Modular.get<GameFieldStore>();
  final GameController _gameController = Modular.get<GameController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gameController.resetPoint();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Modular.dispose<GameFieldStore>();
  }

  void showChampionDialog({required String playerName}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AppDialog.primary(
          backgroundColor: AppColors.secondary.value,
          title: 'Temos um vencedor',
          message: '$playerName venceu essa partida',
          primaryButton: SizedBox(
            width: 450,
            child: AppButton.primary(
              onPressed: () {
                _gameFieldStore.reset();
                Modular.to.pop();
              },
              backgroundColor: WidgetStateProperty.all(AppColors.neutral.value),
              child: AppText.regular(
                'Continuar',
                color: AppColors.secondary.value,
                fontSize: 12,
              ),
            ),
          ),
          secondaryButton: SizedBox(
            width: 450,
            child: AppButton.primary(
              onPressed: () {
                Modular.to.pop();
                Modular.to.popAndPushNamed(GameRoutes.players);
              },
              backgroundColor: WidgetStateProperty.all(AppColors.neutral.value),
              child: AppText.regular(
                'Sair',
                color: AppColors.secondary.value,
                fontSize: 12,
              ),
            ),
          ),
        );
      },
    );
  }

  void onHouse() {
    final List<int> fields =
        _gameFieldStore.isPlayer1
            ? _gameFieldStore.player1Fields
            : _gameFieldStore.player2Fields;

    final String playerChampionName =
        _gameFieldStore.isPlayer1
            ? _gameController.player1Name
            : _gameController.player2Name;

    final bool hasWin = _gameController.hasWinCondition(
      playersFields: fields,
      isPlayer1: _gameFieldStore.isPlayer1,
    );

    if (hasWin) {
      showChampionDialog(playerName: playerChampionName);
    }

    _gameFieldStore.onChangePlayer();
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
                    playerNameColor: _gameFieldStore.isPlayer1 ? AppColors.positive.value : AppColors.neutral.value,
                    name:
                        '(${_gameFieldStore.player1Symbol}) ${_gameController.player1Name}',
                    point: _gameController.player1point,
                  ),
                  PlayerPoints(
                    playerNameColor: !_gameFieldStore.isPlayer1 ? AppColors.positive.value : AppColors.neutral.value,
                    name:
                        '(${_gameFieldStore.player2Symbol}) ${_gameController.player2Name}',
                    point: _gameController.player2point,
                  ),
                ],
              );
            },
          ),
          Gap(size.height * 0.1),
          Container(
            alignment: Alignment.center,
            child: GameField(onHouse: (_) => onHouse()),
          ),
        ],
      ),
    );
  }
}
