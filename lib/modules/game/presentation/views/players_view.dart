import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tiktaktoe/core/assets/images/app_images.dart';
import 'package:tiktaktoe/core/components/app_button/app_button.dart';
import 'package:tiktaktoe/core/components/app_text/app_text.dart';
import 'package:tiktaktoe/core/components/app_text_field/app_text_field.dart';
import 'package:tiktaktoe/core/theme/app_colors.dart';
import 'package:tiktaktoe/modules/game/game_routes.dart';
import 'package:tiktaktoe/modules/game/presentation/controllers/game_controller/game_controller.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({super.key});

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  final GameController _gameController = Modular.get<GameController>();

  String _player1Name = '';
  String _player2Name = '';
  bool _loading = false;

  void onPlayGame() {
    if (_loading || (_player1Name == '' && _player2Name == '')) return;

    setState(() {
      _loading = true;
    });

    _gameController.setPlayersName(
      player1Name: _player1Name,
      player2Name: _player2Name,
    );

    Modular.to.popAndPushNamed(GameRoutes.game);

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.primary.value,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(backgroundColor: AppColors.primary.value),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Gap(size.height * 0.02),
              Center(
                child: AppText.regular(
                  'Tik Tak Toe',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.1,
                ),
              ),
              Gap(size.height * 0.02),
              Image.asset(AppImages.logo, scale: 1.7),
              Gap(size.height * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                child: AppText.regular(
                  'Jogador 1',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.05,
                ),
              ),
              Gap(size.height * 0.01),
              AppTextField(
                maxLength: 5,
                onChanged: (value) {
                  setState(() {
                    _player1Name = value;
                  });
                },
              ),
              Gap(size.height * 0.01),
              Container(
                alignment: Alignment.centerLeft,
                child: AppText.regular(
                  'Jogador 2',
                  color: AppColors.neutral.value,
                  fontSize: size.width * 0.05,
                ),
              ),
              Gap(size.height * 0.01),
              AppTextField(
                maxLength: 5,
                onChanged: (value) {
                  setState(() {
                    _player2Name = value;
                  });
                },
              ),
              Gap(size.height * 0.03),
              SizedBox(
                width: size.width,
                height: 50,
                child: AppButton.primary(
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.neutral.value,
                  ),
                  onPressed: onPlayGame,
                  child: AppText.bold(
                    'Jogar',
                    color: AppColors.primary.value,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
              Gap(size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
